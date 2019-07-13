# VSCode-CMake-Container Project Template #
This is example of boost application utilizing VSCode's remote container(Docker) feature to isolate development environment from user's host environment and hence, speedup overall development setup.

This project template also based on CMake and utilizing CMake Tools, an extensions for VSCode.


## Prerequisite ##
* Docker
* VSCode
* VSCode Remote Containers extensions
* VSCode CMake Tools(<code>vector-of-bool.cmake-tools</code>)
* VSCode C/C++ Tools(<code>ms-vscode.cpptools</code>)

## Configuration ##
You can configure the project to be opened using VSCode with remote containers support using following script:

``` bash
git clone https://github.com/nodefluxio/vscode_template
cd vscode_template
./configure_vscode.sh
```


## Opening Project ##
From VSCode IDE, we can open project using menu "Remote-Containers: Open Folder in Container.." and select <code>vscode_template</code> project folder.

VSCode will automatically build required container based on <code>Dockerfile</code>, configure CMake, and setup connection required to the container so we can interactively build and debug our application.

## Customizations ##
### Folder structure ###
The project is structured as library+sample application, so basically there will be top level <code>CMakeLists.txt</code> for main library and the one in <code>example</code> subfolder.

```
examples\
   CMakeLists.txt          # application CMakeLists.txt
   sample.cpp              # application source code
include\vscode_template\   # library include folder
   library.h               # library header
src\                       # main library folder
   library.cpp             # library source code
CMakeLists.txt             # library main CMakeLists
Dockerfile                 # Dockerfile for this project build environment
README.md                  # this file
configure_vscode.sh        # script for generating VSCode project setting file
```
### Add CMake arguments ###
To add arguments to CMake configuration process, which will be invoked automatically when you open VSCode project folder, you can add the arguments when execute <code>configure_vscode.sh</code>, for e.g:
``` bash
./configure_vscode.h -DINSTALL_PREFIX=/usr/local -DENABLE_CUDA=true
```

### Add docker run arguments ###
Sometimes you need to pass additional argument when invoking Docker, for e.g using <code>--runtime=nvidia</code>. You can edit the arguments in <code>configure_vscode.sh</code>:
``` bash
docker_run_args='"--cap-add=SYS_PTRACE",
                 "--security-opt",
                 "seccomp=unconfined"'
...
```
All the default args are required by VSCode remote container systems
