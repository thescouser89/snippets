# CMake Notes
## CMake Resources

### Variables
http://www.cmake.org/Wiki/CMake_Useful_Variables

### Syntax
http://www.cmake.org/cmake/help/syntax.html

### Misc
http://www.cmake.org/Wiki/CMake

### FAQ
http://www.cmake.org/Wiki/CMake_FAQ

## CMake Variables
PROJECT_SOURCE_DIR
: contains the full path to the root of your project source directory, i.e. to
  the nearest directory where CMakeLists.txt contains the PROJECT() command

PROJECT_BINARY_DIR
: contains the full path to the top level directory of your build tree

## Basic example
```cmake
cmake_minimum_required (VERSION 2.6)
project (Tutorial)
add_executable(Tutorial tutorial.cpp)
```

## Adding a version number and configured header file
```cmake
cmake_minimum_required (VERSION 2.6)
project (Tutorial)
# The version number.
set (Tutorial_VERSION_MAJOR 1)
set (Tutorial_VERSION_MINOR 0)

# configure a header file to pass some of the CMake settings
# to the source code
configure_file (
  "${PROJECT_SOURCE_DIR}/TutorialConfig.h.in"
  "${PROJECT_BINARY_DIR}/TutorialConfig.h"
  )

# add the binary tree to the search path for include files
# so that we will find TutorialConfig.h
include_directories("${PROJECT_BINARY_DIR}")

# add the executable
add_executable(Tutorial tutorial.cxx)
```

And then, in TutorialConfig.h,
```cpp
// the configured options and settings for Tutorial
#define Tutorial_VERSION_MAJOR @Tutorial_VERSION_MAJOR@
#define Tutorial_VERSION_MINOR @Tutorial_VERSION_MINOR@
```

In tutorial.cpp file, you can now add
```cpp
#include "TutorialConfig.h"
```

## Adding a library
Now we will add a library to our project. This library will contain our own
implementation for computing the square root of a number. The executable can
then use this library instead of the standard square root function provided by
the compiler. For this tutorial we will put the library into a subdirectory
called MathFunctions. It will have the following one line CMakeLists file:

```cmake
add_library(MathFunctions mysqrt.cxx)
```
To make use of the new library we add an add_subdirectory call in the top level
CMakeLists file so that the library will get built. We also add another include
directory so that the MathFunctions/mysqrt.h header file can be found for the
function prototype. The last change is to add the new library to the executable.
The last few lines of the top level CMakeLists file now look like:

```cmake
# Find MathFunctions/mysqrt.h
include_directories ("${PROJECT_SOURCE_DIR}/MathFunctions")

# Added so that library gets built
add_subdirectory (MathFunctions)

# add the executable
add_executable (Tutorial tutorial.cpp)
target_link_libraries (Tutorial MathFunctions)
```

Now let us consider making the MathFunctions library optional. In this tutorial
there really isn’t any reason to do so, but with larger libraries or libraries
that rely on third party code you might want to. The first step is to add an
option to the top level CMakeLists file.

```cmake
# should we use our own math functions?
option (USE_MYMATH
        "Use tutorial provided math implementation" ON)
```

```cmake
# add the MathFunctions library?
if (USE_MYMATH)
  include_directories ("${PROJECT_SOURCE_DIR}/MathFunctions")
  add_subdirectory (MathFunctions)
  set (EXTRA_LIBS ${EXTRA_LIBS} MathFunctions)
endif (USE_MYMATH)

# add the executable
add_executable (Tutorial tutorial.cxx)
target_link_libraries (Tutorial  ${EXTRA_LIBS})
```

In the source code:
```cpp
#ifdef USE_MYMATH
#include "MathFunctions.h"
#endif
```

In the source code we make use of USE_MYMATH as well. This is provided from
CMake to the source code through the TutorialConfig.h.in configured file by
adding the following line to it:

```cpp
#cmakedefine USE_MYMATH
```

## Installing and Testing

For the MathFunctions library we setup the library and the header file to be
installed by adding the following two lines to MathFunctions’ CMakeLists file:

(Notice it says MathFunctions CMakeLists!)

```cmake
install (TARGETS MathFunctions DESTINATION bin)
install (FILES MathFunctions.h DESTINATION include)
```

For the application the following lines are added to the top level CMakeLists
file to install the executable and the configured header file:

```cmake
# add the install targets
install (TARGETS Tutorial DESTINATION bin)
install (FILES "${PROJECT_BINARY_DIR}/TutorialConfig.h"
         DESTINATION include)
```

The CMake variable CMAKE_INSTALL_PREFIX is used to determine the root of where
the files will be installed.

At the end of the top level CMakeLists file we can add a number of basic tests
to verify that the application is working correctly.

```cmake
add_test (TutorialRuns Tutorial 25)
set_tests_properties (TutorialComp25
  PROPERTIES PASS_REGULAR_EXPRESSION "25 is 5")

add_test (TutorialNegative Tutorial -25)
set_tests_properties (TutorialNegative
  PROPERTIES PASS_REGULAR_EXPRESSION "-25 is 0")
```

If you wanted to add a lot of tests to test different input values you might
consider creating a macro like the following:

```cmake
macro (do_test arg result)
  add_test (TutorialComp${arg} Tutorial ${arg})
  set_tests_properties (TutorialComp${arg}
    PROPERTIES PASS_REGULAR_EXPRESSION ${result})
endmacro (do_test)

# do a bunch of result based tests
do_test (25 "25 is 5")
do_test (-25 "-25 is 0")
```

## Adding System Introspection
Next let us consider adding some code to our project that depends on features
the target platform may not have. For this example we will add some code that
depends on whether or not the target platform has the log and exp functions.

```cmake
# does this system provide the log and exp functions?
include (CheckFunctionExists.cmake)
check_function_exists (log HAVE_LOG)
check_function_exists (exp HAVE_EXP)
```

```cpp
// does the platform provide exp and log functions?
#cmakedefine HAVE_LOG
#cmakedefine HAVE_EXP

// if we have both log and exp then use them
#if defined (HAVE_LOG) && defined (HAVE_EXP)
  result = exp(log(x)*0.5);
#else // otherwise use an iterative approach
```
