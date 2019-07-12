cmake_minimum_required(VERSION 3.14)
project(vscode_sample_app)

set(CMAKE_CXX_STANDARD 14)

add_executable(${PROJECT_NAME} sample.cpp)
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../include)
target_link_libraries(${PROJECT_NAME} ${CMAKE_PROJECT_NAME})

