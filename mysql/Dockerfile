FROM mysql:5.7   

ENV MYSQL_ROOT_PASSWORD secret
ENV MYSQL_DATABASE housekeeping
ENV MYSQL_USER admin
ENV MYSQL_PASSWORD redhat@123
COPY ./db.sql /tmp/db.sql 

RUN /bin/bash -c "/usr/bin/mysqld_safe --skip-grant-tables &" && \
  sleep 5 && \
  mysql -u root housekeeping < /tmp/db.sql

