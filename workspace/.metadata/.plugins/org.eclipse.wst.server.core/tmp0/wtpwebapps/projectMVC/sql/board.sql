--Oracle[테이블]
CREATE TABLE board(
     seq NUMBER NOT NULL,               -- 글번호 (시퀀스 객체 이용)
     id VARCHAR2(20) NOT NULL,          -- 아이디
     name VARCHAR2(40) NOT NULL,        -- 이름
     email VARCHAR2(40),                -- 이메일
     subject VARCHAR2(255) NOT NULL,    -- 제목
     content VARCHAR2(4000) NOT NULL,   -- 내용 

     ref NUMBER NOT NULL,               -- 그룹번호
     lev NUMBER DEFAULT 0 NOT NULL,     -- 단계
     step NUMBER DEFAULT 0 NOT NULL,    -- 글순서
     pseq NUMBER DEFAULT 0 NOT NULL,    -- 원글번호
     reply NUMBER DEFAULT 0 NOT NULL,   -- 답변수

     hit NUMBER DEFAULT 0,              -- 조회수
     logtime DATE DEFAULT SYSDATE
 );
--Oracle[시퀀스]
CREATE SEQUENCE seq_board  NOCACHE NOCYCLE;



--MySQL
CREATE TABLE board (
    seq BIGINT PRIMARY KEY AUTO_INCREMENT, -- 글번호 (시퀀스 객체 이용)
    id VARCHAR(20) NOT NULL,               -- 아이디
    name VARCHAR(40) NOT NULL,             -- 이름
    email VARCHAR(40),                     -- 이메일
    subject VARCHAR(255) NOT NULL,         -- 제목
    content VARCHAR(4000) NOT NULL,        -- 내용

    ref BIGINT NOT NULL,                   -- 그룹번호
    lev BIGINT DEFAULT 0 NOT NULL,         -- 단계
    step BIGINT DEFAULT 0 NOT NULL,        -- 글순서
    pseq BIGINT DEFAULT 0 NOT NULL,        -- 원글번호
    reply BIGINT DEFAULT 0 NOT NULL,       -- 답변수

    hit BIGINT DEFAULT 0,                  -- 조회수
    logtime DATETIME DEFAULT CURRENT_TIMESTAMP
);
[예] MySQL
	logtime DATE DEFULT (current_date) --날짜
    logtime DATETIME DEFULT (current_time)--시간
    logtime DATETIME DEFULT current_timestamp--날짜&시간
    logtime DATETIME DEFULT now()--날짜&시간

    삭제 프로시저
DELIMITER $$
create procedure boardDelete(in seq_val BIGINT)
		
		begin
			update board set reply=reply-1 
			where seq =(select p.pseq from (select pseq from board where seq=seq_val) as p);
			
			update board set subject = concat('[원글이 삭제된 답글]', subject) where pseq=seq_val;
			
			delete from board where seq=seq_val;
		END $$
		DELIMITER ;

		
		인서트 프로시저
		delimiter //
create procedure boardWrite(in id_val varchar(20)
							, name_val varchar(40)
                            , email_val varchar(40)
                            , subject_val varchar(255)
                            , content_val varchar(4000))
	begin
		INSERT INTO board(id, name, email, subject, content, ref)
        VALUES(id_val
        ,name_val
        ,email_val
        ,subject_val
        ,content_val
        ,0
        );
        update board set ref = last_insert_id() where seq = last_insert_id();
      end//
	delimiter ;

