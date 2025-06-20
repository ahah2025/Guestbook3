##############################################
# guestbook 만들기
##############################################

-- -----------------------------------------
# guestbook 계정에서 실행
-- -----------------------------------------
 
-- db 선택
use guestbook_db;

-- 테이블 삭제
drop table gbook;

-- 테이블생성 
create table gbook(
    no			int              primary key          auto_increment,
    name		varchar(80)      not null,
    password   	varchar(20),
    content	    text,
    reg_date    datetime
);

-- 테이블조회
select * from gbook;

select  no as 식별번호,
        name as 이름,
        password as 비밀번호,
        content as 본문,
        reg_date as 등록일
from gbook
order by no asc
;

-- 등록
insert into gbook
values(null, '정우성','1111','안녕하세요. 정우성입니다.','2025-06-16')
;

insert into gbook
values(null, '이효리','2222','안녕하세요. 이효리입니다.','2025-06-15')
;

insert into gbook
values(null, '강호동','3333','안녕하세요. 강호동입니다.','2025-06-14')
;

-- 수정
update gbook
set  name = '서장훈' , 
     password = '4444',
     content = '안녕하세요. 서장훈입니다.' 
where no = 4 
;

-- 삭제
delete from gbook
where no = 4 ;
