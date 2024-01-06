#!/bin/sh

cd src
make linux
cd ..

cd examples
make linux
cd ..



# 查看所有的*.o 成员
ar -tv ./src/libshttpd.a

# 显示libshttpd.a, 查看有没有SSLv23_server_method, 否则运行时会报错: set_ssl: cannot find SSLv23_server_method
objdump -t ./src/libshttpd.a | grep *UND* | grep SSLv23_server_method

# 查看本机openssl 中的ssl.h 是否带有SSLv23_server_method
cat /usr/include/openssl/ssl.h | grep SSLv23_server_method

# 
objdump -T /usr/lib/x86_64-linux-gnu/libssl.so | grep SSLv23_server_method
