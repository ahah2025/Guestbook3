##############################################
# guestbook 만들기
##############################################

-- -----------------------------------------
# root 계정에서 실행
-- -----------------------------------------
-- guestbook 계정생성
create user 'guestbook'@'%' identified by 'guestbook'; 

-- guestbook 권한 부여
grant all privileges on guestbook_db.* to 'guestbook'@'%';

-- guestbook_db 생성
create database guestbook_db
    default character set utf8mb4
    collate utf8mb4_general_ci
    default encryption='n'
;

-- datebase 조회
show databases;