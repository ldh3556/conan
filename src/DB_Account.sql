create table account_table_test (
    id varchar2(20 char) primary key,
    pw varchar2(20 char) not null,
    pw_check varchar2(20 char) not null,
    name varchar2(20 char) not null,
    nickname varchar2(20 char) not null
);

// create sequence account_table_test_seq;

insert into account_table_test values('gh456', 'gh456', 'gh456', '성기훈', '456번');

select * from account_table_test;





