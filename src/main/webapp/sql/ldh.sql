create table bracket_test (
song_id number(3) primary key,
song_title varchar2(50) not null,
win_count number(4) default 0
);
insert into bracket_test (song_id, song_title) values (bracket_test_seq.nextval,'빛이 될거야');
create sequence bracket_test_seq;
select * from bracket_test;

update bracket_test
set win_count = win_count - 1
where song_id = ?;

select * from bracket_test;

select * from bracket_test order by DBMS_RANDOM.RANDOM
FETCH FIRST 8 ROWS ONLY;

drop table bracket_test;
drop sequence bracket_test_seq;

delete bracket_test where song_id = 12;

update bracket_test set song_title='Love is Thrill, Shock, Suspense' where song_id=4;