#!/usr/bin/env bash

dropdb memos > /dev/null 2>&1
createdb memos
psql memos -c "CREATE TABLE memos ( \
  id SERIAL NOT NULL, \
  title TEXT NOT NULL, \
  content TEXT NOT NULL, \
  PRIMARY KEY (id) \
);"
psql memos -c "INSERT INTO memos (title, content) VALUES ('title1', 'content1');"
psql memos -c "INSERT INTO memos (title, content) VALUES ('title2', 'content2');"
psql memos -c "INSERT INTO memos (title, content) VALUES ('title3', 'content3');"
