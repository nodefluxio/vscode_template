# change the argument for docker run here
docker_run_args='"--cap-add=SYS_PTRACE",
                 "--security-opt",
		 "seccomp=unconfined"'

cmake_args=""
for argument; do #syntactic sugar for: for argument in "$@"; do
    key=${argument%%=*}
    value=${argument#*=}

    if [[ $key =~ ^\-D ]]; then
	    cmake_args="$cmake_args"'"'"${key:2}"'":"'"$value"'",'
    fi
done
if [[ "$cmake_args" =~ ,$ ]]; then
	cmake_args="${cmake_args::-1}"
fi
echo "creating VSCode-Cmake-Container configuration with cmake_args=$cmake_args[done]"

mkdir -p .devcontainer
cd .devcontainer
echo '{
        "name" : "C++",
	"dockerFile" : "Dockerfile",
	"extensions" : ["ms-vscode.cpptools", "vector-of-bool.cmake-tools"],
	"runArgs" : ['"$docker_run_args"']
        ]
}'> devcontainer.json
ln -sf ../Dockerfile Dockerfile
cd ..

mkdir -p .vscode
cd .vscode
echo '{
    "C_Cpp.default.configurationProvider": "vector-of-bool.cmake-tools",
    "files.associations": {
        "string": "cpp"

    },
    "cmake.configureSettings": {
            '"$cmake_args"'
        }
}'> settings.json
cd ..

