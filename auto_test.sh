#!/bin/sh



#
# EXAMPLES
#

# Start listening on port 8080 for HTTP, and 8043 for HTTPS connections. 
# Use /etc/cert.pem as SSL certificate file. Web root is /var/www. In addition, map directory /tmp to URI /aa, directory /etc to URI /bb.
# 开始在端口8080上侦听HTTP, 在端口8043上侦听HTTPS连接.
# 使用/etc/cert.pem作为SSL证书文件.Web根目录是/var/.
# 此外, 将目录/tmp映射到URI/aa, 将目录/etc映射到URI/bb.
rm /tmp/ca.pem
cp ./certs/ca.pem /tmp/ca.pem
./src/shttpd -root /var/www -ports 8080,8043s -ssl_cert /tmp/ca.pem -aliases /aa=/tmp,/bb=/etc
#./src/shttpd -root /var/www -ports 8080,8043 -ssl_cert /tmp/ca.pem -aliases /aa=/tmp,/bb=/etc

curl 127.0.0.1:8080
curl -k --insecure 127.0.0.1:8043




# Deny connections from everywhere, allow only IP address 1.2.3.4 and all IP addresses from 10.0.0.0/8 subnet to connect.
# 拒绝来自任何地方的连接, 只允许IP地址1.2.3.4和10.0.0.0/8子网中的所有IP地址进行连接.
#./src/shttpd -acl -0.0.0.0/0,+10.0.0.0/8,+1.2.3.4


# Start listening on port 8080, create an administrative URI "/ctl" where options may be changed at runtime, and protect that URI with authorization.
# 在8080端口上开始侦听, 创建一个管理URI"/ctl", 其中的选项可以在运行时更改, 并通过授权保护该URI.
#./src/shttpd -ports 8080 -cfg_uri /ctl -protect /ctl=/tmp/passwords.txt

