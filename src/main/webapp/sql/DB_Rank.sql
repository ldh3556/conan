create table worldcup_rank (
    person_id number(3) primary key,      -- 인물의 pk
    person_name varchar2(50) not null,   -- 인물 이름
    win_count number(4) default 0       -- 인물의 우승횟수
);

create sequence worldcup_rank_seq;
insert into worldcup_rank (person_id, person_name) values (worldcup_rank_seq.nextval,'브라운');





select * from worldcup_rank;