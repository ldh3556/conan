create table board_table_test(
    id varchar2(20 char) primary key,
    name varchar2(20 char) not null,
    description varchar2(200 char) not null);

create sequence board_table_test_seq;

insert into board_table_test values ('sh04070', 'kim', '코난이 참 좋아요');

select * from board_table_test;