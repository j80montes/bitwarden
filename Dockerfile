FROM bitwardenrs/server:latest

# 使用 mariadb-client 代替 mysql-client
# debian 下安装 mysql-client 较困难
RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g; s|http://security.debian.org/debian-security|http://archive.debian.org/debian-security|g' /etc/apt/sources.list \
    && apt-get -o Acquire::Check-Valid-Until=false update \
    && echo 'y' | apt install mariadb-client

COPY ./entrypoint.sh ./entrypoint.sh

RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

CMD ["/start.sh"]

