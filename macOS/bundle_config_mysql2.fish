#!/usr/bin/env fish

brew install openssl mysql@5.6 postgresql@10
bundle config --global build.mysql2 \
  --with-ldflags=-L/usr/local/opt/openssl/lib \
  --with-cppflags=-I/usr/local/opt/openssl/include \
  --with-mysql-config=/usr/local/Cellar/mysql@5.6/5.6.43/bin/mysql_config \
  --with-opt-lib=/usr/local/opt/openssl/lib
bundle config --global build.pg \
  --with-pg-config=/usr/local/Cellar/postgresql@10/10.9/bin/pg_config
