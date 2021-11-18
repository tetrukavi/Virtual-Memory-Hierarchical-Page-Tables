#include <iostream>
#include "VirtualMemory.h"
#include "PhysicalMemory.h"

#define SUCCESS 1
#define FAILURE 0

struct frame_state
{
	// case 1:
	word_t empty_frame_index;
	bool found_empty_frame;
	// case 3:
	word_t parent_index;
	int location_in_frame;
	int max_path;
	word_t evict_frame_index; // todo - check which type is it
	uint64_t &page_to_return;
};

void clearTable(uint64_t frameIndex)
{
	for (uint64_t i = 0; i < PAGE_SIZE; ++i)
	{
		PMwrite(frameIndex * PAGE_SIZE + i, 0);
	}
}

void VMinitialize()
{
	clearTable(0);
}

void recursive_search_frame(uint64_t frame_index, uint64_t parent_index, int depth, int
&max_frame_index, frame_state
*pState, int num_even, int num_odd, int location_in_frame, word_t caller_frame, uint64_t path_to_leaf)
{
	word_t temp;
	bool empty_frame = true;


	if (depth == TABLES_DEPTH)
	{
//		pState->page_to_return = path_to_leaf;
		((frame_index % 2) == 0) ? num_even++ : num_odd++;
		((path_to_leaf % 2) == 0) ? num_even++ : num_odd++;
		int weight = (WEIGHT_EVEN * num_even) + (WEIGHT_ODD * num_odd);
		if (weight > pState->max_path)
		{
			pState->max_path = weight;
			pState->evict_frame_index = frame_index;
			pState->parent_index = parent_index;
			pState->location_in_frame = location_in_frame;
			pState->page_to_return = path_to_leaf;

		}
		return;
	}
	bool is_updated = false;
	for (int i = 0; i < PAGE_SIZE; ++i)
	{
		PMread((frame_index * PAGE_SIZE) + i, &temp);
		if (temp != 0)
		{
//            if (temp == 2){
//                int x = 8;
//            }

			empty_frame = false;
			max_frame_index++;
			if (!is_updated){
				((frame_index % 2) == 0) ? num_even++ : num_odd++;
				is_updated = true;
			}
//            ((temp % 2) == 0) ? num_even++ : num_odd++;
//			path_to_leaf = (path_to_leaf << OFFSET_WIDTH) + i;
			recursive_search_frame(temp, frame_index,depth + 1, max_frame_index, pState, num_even,
								   num_odd, i, caller_frame, (path_to_leaf << OFFSET_WIDTH) + i);
		}
	}
	if (empty_frame && (caller_frame != frame_index))
	{
		PMwrite((parent_index * PAGE_SIZE) + location_in_frame, 0);
		pState->found_empty_frame = true;
		pState->empty_frame_index = frame_index;
	}
}

uint64_t searchInTree(uint64_t frame_index, int depth, int &max_frame_index, frame_state *pState, word_t caller_frame,
					  uint64_t path_to_leaf)
{
	int num_even = 0, num_odd = 0;
	recursive_search_frame(frame_index, -1, depth, max_frame_index, pState, num_even, num_odd,
						   -1, caller_frame, path_to_leaf);
	if (pState->found_empty_frame)
	{
		return pState->empty_frame_index;
	}
	else if ((max_frame_index + 1) < NUM_FRAMES)
	{
		return max_frame_index + 1;
	}
	// option 3:
	PMevict(pState->evict_frame_index, pState->page_to_return);
//	pState->max_path = -1;
	PMwrite((pState->parent_index * PAGE_SIZE) + pState->location_in_frame, 0);
	return pState->evict_frame_index;
}

void init_struct(frame_state &state, word_t frame_to_return, bool is_empty_frame, word_t
parent_evict, int location, int max_path, word_t evict_index, uint64_t page)
{
	state.empty_frame_index = frame_to_return;
	state.found_empty_frame = is_empty_frame;
	state.parent_index = parent_evict;
	state.location_in_frame = location;
	state.max_path = max_path;
	state.evict_frame_index = evict_index;
	state.page_to_return = page;
}

uint64_t get_physical_addr(uint64_t virtualAddress)
{
	uint64_t offset = virtualAddress & ((1 << OFFSET_WIDTH) - 1);
	uint64_t page = virtualAddress >> OFFSET_WIDTH;
	uint64_t path_arr[TABLES_DEPTH];
	uint64_t to_tag = page;              //todo - maybe can be without this variable
	for (uint64_t i = 0; i < TABLES_DEPTH; ++i)
	{
		path_arr[(TABLES_DEPTH - 1) - i] = to_tag & ((1 << OFFSET_WIDTH) - 1);
		to_tag = to_tag >> OFFSET_WIDTH;
	}
	word_t addr_i = 0, frame_to_return = -1, parent_evict = -1;
	int depth_index = 0, max_frame_index = 0, location = -1, max = -1;
	uint64_t page_to_evict = 0, path_to_leaf = 0;
	frame_state state = {frame_to_return, false, parent_evict, location, max,
						 -1,page_to_evict};
	while (depth_index < TABLES_DEPTH)
	{
		if (depth_index == 0)
		{
			PMread(0 + path_arr[depth_index], &addr_i);
			if (addr_i == 0)
			{
				uint64_t found_frame = searchInTree(0, 0, max_frame_index, &state, 0,
													path_to_leaf);
				clearTable(found_frame);
				PMwrite(0 + path_arr[depth_index], found_frame);
				addr_i = found_frame;
			}
			// TODO CHECK WHAT TO DO IF NOT 0
		}
		else if (depth_index == TABLES_DEPTH - 1) // last index -> before returning
		{
			word_t addr_i_2; // TODO - DEAL WITH THAT
			PMread(addr_i * PAGE_SIZE + path_arr[depth_index], &addr_i_2);

			if (addr_i ==2)
			{
				int bomb =5;
			}

			if (addr_i_2 == 0)
			{
				uint64_t found_frame = searchInTree(0, 0, max_frame_index, &state, addr_i,
													path_to_leaf);
				PMrestore(found_frame, page);
				PMwrite((addr_i * PAGE_SIZE) + path_arr[depth_index], found_frame);
				addr_i = found_frame;
			}
			else
			{
				addr_i = addr_i_2;
			}
		}
		else
		{
			word_t addr_i_2;
			PMread(addr_i * PAGE_SIZE + path_arr[depth_index], &addr_i_2);
			if (addr_i_2 == 0)
			{
				uint64_t found_frame = searchInTree(0, 0, max_frame_index, &state, addr_i,
													path_to_leaf);
				clearTable(found_frame);
				PMwrite((addr_i * PAGE_SIZE) + path_arr[depth_index], found_frame);
				addr_i = found_frame;
			}
			else
			{
				addr_i = addr_i_2;
			}
		}
		max_frame_index = 0;
		path_to_leaf = 0;
		parent_evict = -1;
		location = -1;
		max = -1;
		init_struct(state, frame_to_return, false, parent_evict, location, max,
					-1,-1);
		depth_index++;
	}
	return (addr_i * PAGE_SIZE) + offset;
}

int VMread(uint64_t virtualAddress, word_t *value)
{
	// out of the range of the virtual memory
	if (virtualAddress < 0 || virtualAddress >= VIRTUAL_MEMORY_SIZE)
	{
		return FAILURE;
	}
	uint64_t physical_address = get_physical_addr(virtualAddress);
	PMread(physical_address, value);
	return SUCCESS;
}

int VMwrite(uint64_t virtualAddress, word_t value)
{
	// out of the range of the virtual memory
	if (virtualAddress < 0 || virtualAddress >= VIRTUAL_MEMORY_SIZE)
	{
		return FAILURE;
	}
	uint64_t physical_address = get_physical_addr(virtualAddress);
	PMwrite(physical_address, value);
	return SUCCESS;
}


