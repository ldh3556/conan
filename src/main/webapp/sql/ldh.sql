create table bracket_test (
song_id number(3) primary key,      -- 노래의 pk
song_title varchar2(50) not null,   -- 노래 제목
win_count number(4) default 0       -- 노래의 우승횟수
);

insert into bracket_test (song_id, song_title) values (bracket_test_seq.nextval,'빛이 될거야');
create sequence bracket_test_seq;
select * from bracket_test;

update bracket_test
set win_count = win_count - 1
where song_id = ?;

select * from bracket_test;
select song_title, win_count from bracket_test where song_id = 4;
select * from bracket_test order by DBMS_RANDOM.RANDOM
FETCH FIRST 8 ROWS ONLY;

drop table bracket_test;
drop sequence bracket_test_seq;

delete bracket_test where song_id = 12;

update bracket_test set win_count=0 where song_id=8;


create table ost_login(                         -- 기능 개발 때 사용한 로그인 가데이터
    ost_login_pk int primary key,
    ost_login_id varchar2(50) not null,
    ost_login_pw varchar2(30) not null,
    ost_login_nickname varchar2(15) unique
);

ALTER TABLE ost_login
    ADD CONSTRAINT ost_login_id_unique UNIQUE (ost_login_id);

create sequence ost_login_pk_seq;

select * from ost_login;

insert into ost_login values (ost_login_pk_seq.nextval, 'dh1004', 'dh1004', 'DHzzang');

SELECT ost_login_nickname
FROM ost_login
WHERE ost_login_id = 'dh1004';

CREATE TABLE ost_vote_comments (
ost_vote_comment_pk  INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,  -- 고유 댓글 ID (댓글 식별 번호)
ost_login_nickname_fk varchar2(50) NOT NULL,            -- 로그인 테이블의 사용자 닉네임 (외래 키)
user_pick number(3) NOT NULL,     -- 유저가 선택한 최종 우승 노래
comment_text VARCHAR2(500) NOT NULL,  -- 유저의 댓글 내용
comment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- 댓글 작성 날짜 및 시간
FOREIGN KEY (ost_login_nickname_fk) REFERENCES account_table_hdh(nickname),  -- 외래 키 설정
FOREIGN KEY (user_pick) REFERENCES bracket_test(song_id)  -- 외래 키 설정
);

INSERT INTO ost_vote_comments (
    ost_login_nickname_fk,
    user_pick,
    comment_text
) VALUES (
             '조상우',           -- 외래 키로 참조되는 닉네임
             1,                 -- 외래 키로 참조되는 곡 ID
             '이 곡이 정말 최고예요!' -- 댓글 내용
         );
select * from ost_login;

select * from bracket_test;
select * from ost_vote_comments;
drop table ost_vote_comments cascade constraints purge;
drop sequence ost_vote_comment_pk;
create sequence ost_vote_comment_pk;
select ost_vote_comment_pk from ost_vote_comments;
insert into ost_vote_comments values (ost_vote_comment_pk.nextval, 'dh1004', 'asd', 'asd', sysdate);


select * from ost_vote_comments oc order by oc.COMMENT_DATE desc;

select ovc.*, bt.song_title from ost_vote_comments ovc, bracket_test bt
where ovc.USER_PICK = bt.song_id
order by ovc.comment_date desc;



