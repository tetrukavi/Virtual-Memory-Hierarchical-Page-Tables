# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /cygdrive/c/Users/Avi/.CLion2019.3/system/cygwin_cmake/bin/cmake.exe

# The command to remove a file.
RM = /cygdrive/c/Users/Avi/.CLion2019.3/system/cygwin_cmake/bin/cmake.exe -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /cygdrive/c/Users/Avi/CLionProjects/os_ex4

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /cygdrive/c/Users/Avi/CLionProjects/os_ex4/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/NoEvictionVirtualMemory.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/NoEvictionVirtualMemory.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/NoEvictionVirtualMemory.dir/flags.make

CMakeFiles/NoEvictionVirtualMemory.dir/VirtualMemory.cpp.o: CMakeFiles/NoEvictionVirtualMemory.dir/flags.make
CMakeFiles/NoEvictionVirtualMemory.dir/VirtualMemory.cpp.o: ../VirtualMemory.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/cygdrive/c/Users/Avi/CLionProjects/os_ex4/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/NoEvictionVirtualMemory.dir/VirtualMemory.cpp.o"
	/usr/bin/c++.exe  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/NoEvictionVirtualMemory.dir/VirtualMemory.cpp.o -c /cygdrive/c/Users/Avi/CLionProjects/os_ex4/VirtualMemory.cpp

CMakeFiles/NoEvictionVirtualMemory.dir/VirtualMemory.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/NoEvictionVirtualMemory.dir/VirtualMemory.cpp.i"
	/usr/bin/c++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /cygdrive/c/Users/Avi/CLionProjects/os_ex4/VirtualMemory.cpp > CMakeFiles/NoEvictionVirtualMemory.dir/VirtualMemory.cpp.i

CMakeFiles/NoEvictionVirtualMemory.dir/VirtualMemory.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/NoEvictionVirtualMemory.dir/VirtualMemory.cpp.s"
	/usr/bin/c++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /cygdrive/c/Users/Avi/CLionProjects/os_ex4/VirtualMemory.cpp -o CMakeFiles/NoEvictionVirtualMemory.dir/VirtualMemory.cpp.s

CMakeFiles/NoEvictionVirtualMemory.dir/PhysicalMemory.cpp.o: CMakeFiles/NoEvictionVirtualMemory.dir/flags.make
CMakeFiles/NoEvictionVirtualMemory.dir/PhysicalMemory.cpp.o: ../PhysicalMemory.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/cygdrive/c/Users/Avi/CLionProjects/os_ex4/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/NoEvictionVirtualMemory.dir/PhysicalMemory.cpp.o"
	/usr/bin/c++.exe  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/NoEvictionVirtualMemory.dir/PhysicalMemory.cpp.o -c /cygdrive/c/Users/Avi/CLionProjects/os_ex4/PhysicalMemory.cpp

CMakeFiles/NoEvictionVirtualMemory.dir/PhysicalMemory.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/NoEvictionVirtualMemory.dir/PhysicalMemory.cpp.i"
	/usr/bin/c++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /cygdrive/c/Users/Avi/CLionProjects/os_ex4/PhysicalMemory.cpp > CMakeFiles/NoEvictionVirtualMemory.dir/PhysicalMemory.cpp.i

CMakeFiles/NoEvictionVirtualMemory.dir/PhysicalMemory.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/NoEvictionVirtualMemory.dir/PhysicalMemory.cpp.s"
	/usr/bin/c++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /cygdrive/c/Users/Avi/CLionProjects/os_ex4/PhysicalMemory.cpp -o CMakeFiles/NoEvictionVirtualMemory.dir/PhysicalMemory.cpp.s

# Object files for target NoEvictionVirtualMemory
NoEvictionVirtualMemory_OBJECTS = \
"CMakeFiles/NoEvictionVirtualMemory.dir/VirtualMemory.cpp.o" \
"CMakeFiles/NoEvictionVirtualMemory.dir/PhysicalMemory.cpp.o"

# External object files for target NoEvictionVirtualMemory
NoEvictionVirtualMemory_EXTERNAL_OBJECTS =

libNoEvictionVirtualMemory.a: CMakeFiles/NoEvictionVirtualMemory.dir/VirtualMemory.cpp.o
libNoEvictionVirtualMemory.a: CMakeFiles/NoEvictionVirtualMemory.dir/PhysicalMemory.cpp.o
libNoEvictionVirtualMemory.a: CMakeFiles/NoEvictionVirtualMemory.dir/build.make
libNoEvictionVirtualMemory.a: CMakeFiles/NoEvictionVirtualMemory.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/cygdrive/c/Users/Avi/CLionProjects/os_ex4/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX static library libNoEvictionVirtualMemory.a"
	$(CMAKE_COMMAND) -P CMakeFiles/NoEvictionVirtualMemory.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/NoEvictionVirtualMemory.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/NoEvictionVirtualMemory.dir/build: libNoEvictionVirtualMemory.a

.PHONY : CMakeFiles/NoEvictionVirtualMemory.dir/build

CMakeFiles/NoEvictionVirtualMemory.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/NoEvictionVirtualMemory.dir/cmake_clean.cmake
.PHONY : CMakeFiles/NoEvictionVirtualMemory.dir/clean

CMakeFiles/NoEvictionVirtualMemory.dir/depend:
	cd /cygdrive/c/Users/Avi/CLionProjects/os_ex4/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /cygdrive/c/Users/Avi/CLionProjects/os_ex4 /cygdrive/c/Users/Avi/CLionProjects/os_ex4 /cygdrive/c/Users/Avi/CLionProjects/os_ex4/cmake-build-debug /cygdrive/c/Users/Avi/CLionProjects/os_ex4/cmake-build-debug /cygdrive/c/Users/Avi/CLionProjects/os_ex4/cmake-build-debug/CMakeFiles/NoEvictionVirtualMemory.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/NoEvictionVirtualMemory.dir/depend
