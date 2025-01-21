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

insert into account_table_hdh values(account_table_hdh_seq.nextval, '성기훈', '1970', '10', '15','남', 'sgh456@gmail.com', 'sgh456', 'sgh456', 'sgh456', '456번');
insert into account_table_hdh values(account_table_hdh_seq.nextval, '오일남', '1950', '01', '01','남', 'oin001@gmail.com', 'oin001', 'oin001', 'oin001', '001번');
insert into account_table_hdh values(account_table_hdh_seq.nextval, '조상우', '1975', '05', '05','남', 'jsw218@gmail.com', 'jsw218', 'jsw218', 'jsw218', '218번');

select * from account_table_hdh;

-- DROP TABLE account_table_hdh CASCADE CONSTRAINTS;
