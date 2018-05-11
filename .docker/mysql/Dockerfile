FROM mysql:5.7

COPY custom.cnf /etc/mysql/conf.d/custom.cnf
RUN sed -i "s/skip-name-resolve/# skip-name-resolve/" /etc/mysql/conf.d/docker.cnf