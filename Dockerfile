FROM atlassian/ubuntu-minimal

RUN apt-get update \
    && apt-get -y install software-properties-common && \
    add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
    apt update && \
    apt install g++-7 -y && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 \
                        --slave /usr/bin/g++ g++ /usr/bin/g++-7 && \
    update-alternatives --config gcc && \
    apt-get -y install make wget && \

    mkdir ~/temp && cd ~/temp && \
    wget  https://cmake.org/files/v3.14/cmake-3.14.5.tar.gz && \
    tar -zxvf cmake-3.14.5.tar.gz && \
    cd cmake-3.14.5 && \
    ./bootstrap && make -j4 && make install && \

    cd ~/temp && wget http://ftp.gnu.org/gnu/gdb/gdb-8.3.tar.gz && tar -zxvf gdb-8.3.tar.gz && \
    cd gdb-8.3 && ./configure && make -j4 && (make install || echo "ignore known error") &&\

    cd ~/temp &&  wget https://dl.bintray.com/boostorg/release/1.70.0/source/boost_1_70_0.tar.gz && \
    tar -zxvf boost_1_70_0.tar.gz && cd boost_1_70_0 && ./bootstrap.sh && ./b2 cxxflags="-std=c++14" --reconfigure --with-fiber install



    
