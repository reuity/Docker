# 拉取镜像
docker pull nginx

# 启动容器
docker run --name nginx1 -p 8081:80 -d nginx:1.16.0

# 挂载目录
docker run --name nginx2 -p 8082:80 -d \
    -v /data/docker/nginx/www:/usr/share/nginx/html  \
    -v /data/docker/nginx/conf/nginx.conf:/etc/nginx/nginx.conf  \
    -v /data/docker/nginx/logs:/var/log/nginx  nginx:1.16.0



# 安装php

docker pull php:7.1.31-fpm-alpine


docker run --name php-fpm1 -d -v /data/docker/nginx  php:7.1.31-fpm-alpine



docker run --name nginx3 -p 8083:80 -d \
    -v /data/docker/nginx/www:/usr/share/nginx/html:ro \
    -v /data/docker/nginx/conf/conf.d:/etc/nginx/conf.d:ro \
    --link php-fpm1:php  nginx:1.16.0
