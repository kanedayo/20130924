create table samples (
	id integer primary key,
	ctime test,
	title test
);
/*
$ sqlite3 bbs.sqlite
sqlite> .schema
sqlite> .read import.sql
sqlite> .schema
CREATE TABLE comments (
        id integer primary key,
        body test
);
sqlite> select * from comments;
*/