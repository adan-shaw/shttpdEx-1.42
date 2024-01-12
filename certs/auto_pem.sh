#!/bin/sh



cd ./planB

# 1.key的生成

# 需要输入至少4位的密码(随便输入即可, 复杂度没办法破解就行, 不需要记住的, 这个密码是查看证书内容的密码)
#openssl genrsa -des3 -out server.key 2048

# 无密码版本(但需要有*.key 模板作为输入)
#openssl rsa -in server.key.bak -out server.key



# 2. 生成CA的crt
#openssl req -new -x509 -key server.key -out ca.crt -days 3650



# 3.csr的生成方法
#openssl req -new -key server.key -out server.csr



# 4.crt生成方法
#openssl x509 -req -days 3650 -in server.csr -CA ca.crt -CAkey server.key -CAcreateserial -out server.crt



# 5.证书合并(合并后成为自签证书, https 中常用)
#cat server.key server.crt > server.pem



cd ..



openssl genrsa -out private.key 2048

openssl req -new -x509 -key private.key -out ca.pem -days 3650
