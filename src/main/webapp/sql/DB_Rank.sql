CREATE TABLE winner_table_hdh (
    id INT auto_increment PRIMARY KEY,  -- 순위를 구분할 수 있도록 id 추가
    name VARCHAR(50) NOT NULL,
    file VARCHAR(100) NOT NULL,
    rank INT NOT NULL,  -- 우승자 순위를 나타내는 rank 컬럼
    ratio DECIMAL(5,2) DEFAULT 0.00
);

-- 우승자 저장 예시
insert into winner_table_hdh (id, name, file, rank, ratio) values (?, '브라운', '/img/vote/worldcup/men/agasa.png', ?, 100.00);
