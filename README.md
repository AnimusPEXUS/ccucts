# ccutils cmake toolset

(CCUCTS for short)

this toolset (which you could use in your projects too),
is for my ccutils and other my c/c++ projects, using cmake to build projects.

I decided to make CCUCTS, because I didn't wanted to write same cmake scripts individually
to all my projects, so I decided to make one separate project with all my common
cmake scripts and import them everywhere I need.

# how to apply to cmake-based project

add this or similar code to CMakeList.txt

here is how CCUCTS applied to ccutils. you can do something similar in your CMakeLists.txt.

```cmake
include(FetchContent)

set(CCUTILS_CWD)

cmake_path(GET CMAKE_CURRENT_LIST_FILE PARENT_PATH CCUTILS_CWD)

message(STATUS "ccutils CMakeLists.txt :: current directory is ${CCUTILS_CWD}")

set(CCUCTS_DIR "${CCUTILS_CWD}/../ccucts")

if (NOT DEFINED CCUCTS_VERSION)
  # message(STATUS "CCUCTS_VERSION undefined yet, so trying to find and use CCUCTS")
  message(STATUS "Trying to find CCUCTS as ${CCUCTS_DIR}/_import_me.cmake")
  if (EXISTS "${CCUCTS_DIR}/_import_me.cmake")
    message(STATUS "predownloaded CCUCTS found")
  else()
    message(STATUS "CCUCTS not found. fetching from GitHub")
    FetchContent_Declare(
      ccucts_downlod
      GIT_REPOSITORY "https://github.com/AnimusPEXUS/ccucts.git"
      GIT_TAG "origin/master"
    )
    FetchContent_MakeAvailable(ccucts_downlod)
    FetchContent_GetProperties(
      ccucts_downlod
      SOURCE_DIR CCUCTS_DIR
    )

  endif()

  include("${CCUCTS_DIR}/_import_me.cmake")

endif()

project(ccutils)
```

# documentation

TODO
