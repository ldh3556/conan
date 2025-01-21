-- create table account_table_test (
--     id varchar2(20 char) primary key,
--     pw varchar2(20 char) not null,
--     pw_check varchar2(20 char) not null,
--     name varchar2(20 char) not null,
--     nickname varchar2(20 char) not null,
--     CONSTRAINT unique_nickname UNIQUE (nickname)
-- );
--
-- -- cf. create sequence account_table_test_seq;
--
-- insert into account_table_test values('gh456', 'gh456', 'gh456', '성기훈', '456번');
--
-- select * from account_table_test;
--
-- DROP TABLE account_table_test;

------------------------------------------------------------------

-- [요소 더 넣어서 재구성ing]
create table account_table_hdh (
    no varchar2(20 char) primary key,
    name varchar2(20 char) not null,
    birth_year varchar2(20 char) not null,
    birth_month varchar2(20 char) not null,
    birth_day varchar2(20 char) not null,
    gender varchar2(20 char) not null,
    e_mail varchar2(20 char) not null,
    id varchar2(20 char) not null,
    pw varchar2(20 char) not null,
    pw_check varchar2(20 char) not null,
    nickname varchar2(20 char) not null,

    -- no(pk) 외에 유니크 제약 조건 추가
    constraint unique_nickname unique (nickname),
    constraint unique_e_mail unique (e_mail),
    constraint unique_id unique (id)
);

create sequence account_table_hdh_seq;
insert into account_table_hdh values(account_table_hdh_seq.nextval,
'둘리', '1980', '05', '21','남', 'hoitt@123.com', 'dul', 'dul', 'dul', '호잇이계속되면');

select * from account_table_hdh;
-- DROP TABLE account_table_hdh;
