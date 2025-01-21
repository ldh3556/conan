CREATE TABLE characters_test (
id               NUMBER(2)       PRIMARY KEY,
name             VARCHAR2(100)   NOT NULL,              -- 이름
birthday         VARCHAR2(10) not null,                 -- 생일 (DATE 자료형 권장)
short_intro      VARCHAR2(255) not null,                -- 간단 소개, 명대사
description      VARCHAR2(4000) not null,               -- 캐릭터 설명(장문)
button_img_url   VARCHAR2(255) not null,                -- 버튼(목록) 이미지
detail_img_url   VARCHAR2(255) not null                 -- 상세(디테일) 페이지 이미지
);


drop table characters_test cascade constraints purge;

create sequence characters_test_seq;

insert into characters_test values (characters_test_seq.nextval, '코난', '5월 4일', '"진실은 언제나 하나!"','명탐정 코난의 주인공이며, 남도일이 APTX4869를 먹고 어린아이가 된 모습이다.
소꿉친구이자 고등학교 친구는 미란이와 놀이공원에 놀러갔다가 검은 옷을 입은 남자의 수상한 거래 현장을 목격하고 억지로 약을 먹어 초등학생이 되어버린다.', '/img/Encyclop/Characters/conan/conan.png', '/img/Encyclop/Characters/conan/main_img.png');
insert into characters_test values (characters_test_seq.nextval, '유미란', '0월 0일', '너가 코난이구나?', '00000', 'img/Encyclop/Characters/ran/ran.png', 'img/Encyclop/Characters/ran/main_img.png');


select * from characters_test;

delete
from characters_test
where id = 3;