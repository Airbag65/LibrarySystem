drop table if exists loans;
drop table if exists users;
drop table if exists books;

PRAGMA foreign_keys = on;

create table books(
    id integer primary key autoincrement,
    title text not null,
    author text not null,
    available integer not null default 1
);

create table users(
    id integer primary key,
    passCode text not null,
    firstName text not null,
    lastName text not null,
    dept float default null,
    loans integer default null
);

create table loans(
    id integer primary key autoincrement,
    bookId integer not null,
    userId integer not null,
    isReturned integer default 0,
    loanedAt text default current_timestamp,
    latestReturnData text default current_timestamp,
    foreign key (bookId) references books(id),
    foreign key (userId) references users(id)
);

