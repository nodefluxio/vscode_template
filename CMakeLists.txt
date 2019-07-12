cmake_minimum_required(VERSION 3.14)
project(vscode_template)

set(CMAKE_CXX_STANDARD 14)

add_library(${PROJECT_NAME} src/library.cpp examples/sample.cpp)
add_subdirectory(examples)

target_include_directories(${PROJECT_NAME} PUBLIC include)
target_include_directories(${PROJECT_NAME} PRIVATE include/${PROJECT_NAME})

# add the required libraries here
find_package(Boost COMPONENTS context fiber REQUIRED)
if(Boost_FOUND)
    include_directories(${Boost_INCLUDE_DIR})
    target_link_libraries(${PROJECT_NAME} Boost::fiber Boost::context)
endif()

find_package(Threads REQUIRED)
target_link_libraries(${PROJECT_NAME} Threads::Threads)
