create table board_table_test(
    b_no varchar2(20 char) unique,
    b_id varchar2(20 char) primary key,
    b_name varchar2(20 char) not null,
    b_begin varchar2(40 char) not null,
    b_title varchar2(200 char) not null,
    b_text varchar2(4000 char) not null,
    b_date date not null);




create sequence board_table_test_seq;

insert into board_table_test values (board_table_test_seq.nextval,'sh04070', 'kim', '가입인사','안녕하세요' ,'코난이 참 좋아요', sysdate);

select * from board_table_test;

 drop table board_table_test;
;