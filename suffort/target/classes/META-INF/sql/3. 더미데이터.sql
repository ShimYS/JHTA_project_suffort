/*
	회사, 사용자, 경력, 자격증, 카테고리, 태그모음, -->회원 전체게시판, 기업 전체게시판, 사용자 게시판 태그(예범), 기업게시판 태그(예범), 
	커뮤니티 정보, 커뮤니티 태그, 커뮤니티 참여자, 커뮤니티 컨텐츠 모음, 커뮤니티 파일, 커뮤니티 내용(글), 커뮤니티 이미지, 커뮤니티 컨텐츠 태그,
	사용자 게시판 사용자 좋아요(예범), 사용자 게시판 기업 좋아요(예범), 기업 게시판 사용자 좋아요(예범), 
*/


/*기업 테이블 더미데이터*/
insert INTO companies
(company_id, company_password, company_name, company_content, company_url, company_size, company_address)
VALUES
('sanyang12','zxcv1234','삼양기업','안녕하세요 삼양기업입니다. 우리회사는 라면을 중점적으로 만들고 있습니다.', 
		'https://www.samyangfoods.com/kor/information/company/index.do', '대기업','서울특별시 성북구 오패산로3길 104(하월곡동)');
insert INTO companies
(company_id, company_password, company_name, company_content, company_url, company_size, company_address)
VALUES
('doosan23','zxcv1234','두산기업','안녕하세요 두산기업입니다. 우리회사는 야구를 전문적으로 하고 있습니다.', 
		'https://www.doosan.com/kr', '중견기업','서울특별시 송파구 올림픽로 25 잠실야구장내 두산베어스');
insert INTO companies
(company_id, company_password, company_name, company_content, company_url, company_size, company_address)
VALUES
('samsung','zxcv1234','삼성','안녕하세요 삼성입니다. 우리회사는 세계 3위 안에 듭니다.', 
		'https://www.samsung.com/sec/', '대기업','경기도 수원시 영통구 삼성로 129 (매탄동) 삼성전자주식회사');
insert INTO companies
(company_id, company_password, company_name, company_content, company_url, company_size, company_address, company_income, company_started_date)
VALUES
('icecreamedu','zxcv1234','아이스크림에듀','안녕하세요 아이스크림에듀입니다. 개발자를 구합니다.', 
		'www.i-screamedu.co.kr', '중견기업','서울 강남구 테헤란로88길 15', '1900000000', '2013-03-01');
insert INTO companies
(company_id, company_password, company_name, company_content, company_url, company_size, company_address, company_income, company_started_date)
VALUES
('handworks','zxcv1234','에이치앤웍스','안녕하세요 에이치앤웍스입니다. 개발자를 구합니다.', 
		'www.hnworks.co.kr', '중소기업','서울 금천구 가산디지털1로 30, 1512호', '900000000', '2011-03-18');

/*사용자 테이블 더미데이터*/
insert INTO users
(user_id, login_way, user_name)
VALUES('hong123','google/hong','홍길동');
insert INTO users
(user_id, login_way, user_name)
VALUES('kimkim','naver/kimkim','김김이');
insert INTO users
(user_id, login_way, user_name)
VALUES('kang5432','github/kang5432','강감찬');
insert INTO users
(user_id, login_way, user_name, user_gender, user_birth, user_git_addr, user_email, user_gratuation)
VALUES('ryuury38','naver/ryuury38','류관순','F','1909-05-25','github.com/ryugs38','ryuury38@naver.com','초대졸');
insert INTO users
(user_id, login_way, user_name, user_gender, user_birth, user_git_addr, user_email, user_gratuation)
VALUES('happykim23','google/happykim23','김행복','F','1995-12-12','github.com/happy23','happykim23@naver.com','석사');

/*경력 테이블 더미데이터*/
INSERT INTO careers (career_company_name, career_month, career_job_content, career_job_position, user_no)
VALUES ('농심', 12, '시식감별', '대리', 1);
INSERT INTO careers (career_company_name, career_month, career_job_content, career_job_position, user_no)
VALUES ('현대자동차', 43, '시승', '과장', 2);
INSERT INTO careers (career_company_name, career_month, career_job_content, career_job_position, user_no)
VALUES ('최고의직장', 24, '사무보조', '사원', 3);
INSERT INTO careers (career_company_name, career_month, career_job_content, career_job_position, user_no)
VALUES ('국밥', 240, '제조', '점주', 4);
INSERT INTO careers (career_company_name, career_month, career_job_content, career_job_position, user_no)
VALUES ('LG전자', 50, '판매', '차장', 5);

/*자격증 테이블 더미데이터*/
INSERT INTO licenses (license_name, license_grade, license_company, license_registered_date, user_no)
VALUES ('정보처리기사', null, '한국산업인력공단', '2019-01-02', 1);
INSERT INTO licenses (license_name, license_grade, license_company, license_registered_date, user_no)
VALUES ('운전면허', '2종', '도로교통공단', '2019-02-04', 2);
INSERT INTO licenses (license_name, license_grade, license_company, license_registered_date, user_no)
VALUES ('한식', '주부', '대한요식', '2019-06-12', 3);
INSERT INTO licenses (license_name, license_grade, license_company, license_registered_date, user_no)
VALUES ('오라클', null, 'Oracle', '2019-05-03', 4);
INSERT INTO licenses (license_name, license_grade, license_company, license_registered_date, user_no)
VALUES ('수리기사', '고급', '한국전기전자', '2020-07-22', 5);

/*카테고리 테이블 더미데이터*/
INSERT INTO categories (category_name)
VALUES ('프론트앤드');
INSERT INTO categories (category_name)
VALUES ('백앤드');
INSERT INTO categories (category_name)
VALUES ('데이터베이스');
INSERT INTO categories (category_name)
VALUES ('모바일');
INSERT INTO categories (category_name)
VALUES ('임베디드');

/*태그모음 테이블 더미데이터*/
INSERT INTO tags (tag_name, category_no)
VALUES ('Java', '2');
INSERT INTO tags (tag_name, category_no)
VALUES ('C', '2');
INSERT INTO tags (tag_name, category_no)
VALUES ('C+', '2');
INSERT INTO tags (tag_name, category_no)
VALUES ('C#', '2');
INSERT INTO tags (tag_name, category_no)
VALUES ('Spring', '2');

INSERT INTO tags (tag_name, category_no)
VALUES ('HTML', '1');
INSERT INTO tags (tag_name, category_no)
VALUES ('CSS', '1');
INSERT INTO tags (tag_name, category_no)
VALUES ('BootStrap', '1');
INSERT INTO tags (tag_name, category_no)
VALUES ('JavaScript', '1');
INSERT INTO tags (tag_name, category_no)
VALUES ('JQuery', '1');

INSERT INTO tags (tag_name, category_no)
VALUES ('Oracle', '3');
INSERT INTO tags (tag_name, category_no)
VALUES ('mySQL', '3');
INSERT INTO tags (tag_name, category_no)
VALUES ('MariaDB', '3');
INSERT INTO tags (tag_name, category_no)
VALUES ('MongDB', '3');
INSERT INTO tags (tag_name, category_no)
VALUES ('SQLServer', '3');


INSERT INTO tags (tag_name, category_no)
VALUES ('Java-Mobile', '4');
INSERT INTO tags (tag_name, category_no)
VALUES ('Swift', '4');
INSERT INTO tags (tag_name, category_no)
VALUES ('Kotlin', '4');
INSERT INTO tags (tag_name, category_no)
VALUES ('Go', '4');
INSERT INTO tags (tag_name, category_no)
VALUES ('Python', '4');

select * from user_total_boards;
/*회원 전체게시판 테이블 더미데이터*/
insert INTO  user_total_boards
(userboard_title, userboard_content, userboard_git, user_no)
values
('java를 사용한 웹사이트 만들기','설명설명','https://github.com/hong/java-practice',1);
insert INTO  user_total_boards
(userboard_title, userboard_content, userboard_git, user_no)
values
('jQuery를 이용한 로그인창','설명설명','https://github.com/kang5432/jquery-login',3);
insert INTO  user_total_boards
(userboard_title, userboard_content, userboard_git, user_no)
values
('spring을 이용한 기본 게시판 제작','설명설명','https://github.com/ryugs38/spring-boards',4);

/*기업 전체게시판 테이블 더미데이터*/
insert INTO company_total_boards
(compboard_title, compboard_content, company_no)
VALUES
('삼양기업이 인재를 구합니다.','웹개발자 설명설명','1');
insert INTO company_total_boards
(compboard_title, compboard_content, company_no)
VALUES
('두산기업이 인재를 구합니다.','두산베어스 페이지 유지보수할 사람 구합니다.','2');
insert INTO company_total_boards
(compboard_title, compboard_content, company_no)
VALUES
('에이치앤웍스 인재를 구합니다.','중견이지만 강합니다.','5');

/*사용자 게시판 태그 테이블 더미데이터*/
INSERT INTO user_board_tags (userboard_no, tag_no)
VALUES (1, 2);
INSERT INTO user_board_tags (userboard_no, tag_no)
VALUES (1, 5);
INSERT INTO user_board_tags (userboard_no, tag_no)
VALUES (1, 10);
INSERT INTO user_board_tags (userboard_no, tag_no)
VALUES (1, 15);
INSERT INTO user_board_tags (userboard_no, tag_no)
VALUES (1, 17);

/*기업게시판 태그 테이블 더미데이터*/
INSERT INTO company_board_tags (compboard_no, tag_no)
VALUES (1, 1);
INSERT INTO company_board_tags (compboard_no, tag_no)
VALUES (2, 4);
INSERT INTO company_board_tags (compboard_no, tag_no)
VALUES (3, 7);
INSERT INTO company_board_tags (compboard_no, tag_no)
VALUES (3, 12);
INSERT INTO company_board_tags (compboard_no, tag_no)
VALUES (2, 20);

/*커뮤니티 정보 테이블 더미데이터*/
insert INTO communities
(commu_limitnum, commu_title, commu_password, user_no)
VALUES
(5,'JAVA 개발 방', 'zxcv1234',1);
insert INTO communities
(commu_title, commu_password, user_no)
VALUES
('웹 퍼블리셔 준비 방', 'zxcv1234',2);
insert INTO communities
(commu_limitnum, commu_title, commu_password, user_no)
VALUES
(4,'취업상담', 'zxcv1234',1);
insert INTO communities
(commu_title, commu_password, user_no)
VALUES
('이력서 스터디', 'zxcv1234',3);

/*커뮤니티 태그 테이블 더미데이터*/
insert into community_tags
(tag_no, commu_no)
VALUES
(2,1);
insert into community_tags
(tag_no, commu_no)
VALUES
(6,1);
insert into community_tags
(tag_no, commu_no)
VALUES
(12,1);
insert into community_tags
(tag_no, commu_no)
VALUES
(7,2);
insert into community_tags
(tag_no, commu_no)
VALUES
(8,2);
insert into community_tags
(tag_no, commu_no)
VALUES
(2,3);
insert into community_tags
(tag_no, commu_no)
VALUES
(10,3);
insert into community_tags
(tag_no, commu_no)
VALUES
(6,4);
insert into community_tags
(tag_no, commu_no)
VALUES
(13,4);

select * from communities;
/*커뮤니티 참여자 테이블 더미데이터*/
insert INTO community_guests
(commu_no, user_no, guest_grade)
VALUES
(1,1,'방장');
insert INTO community_guests
(commu_no, user_no, guest_grade)
VALUES
(1,4,'매니저');
insert INTO community_guests
(commu_no, user_no)
VALUES
(2,4);
insert INTO community_guests
(commu_no, user_no, guest_grade)
VALUES
(3,1, '방장');
insert INTO community_guests
(commu_no, user_no, guest_grade)
VALUES
(3,5, '매니저');
insert INTO community_guests
(commu_no, user_no,guest_grade)
VALUES
(4,3, '방장');
insert INTO community_guests
(commu_no, user_no)
VALUES
(4,2);
select * from community_guests;
/*커뮤니티 컨텐츠 모음 테이블 더미데이터*/

/*커뮤니티 파일,커뮤니티 내용(글),커뮤니티 이미지, 커뮤니티 컨텐츠 태그 더미데이터 없음*/

/*사용자 게시판 사용자 좋아요 테이블 더미데이터*/
INSERT INTO user_user_likes (userlike_yn, userboard_no, user_no)
VALUES ('Y', 1, 1);
INSERT INTO user_user_likes (userlike_yn, userboard_no, user_no)
VALUES ('Y', 2, 2);
INSERT INTO user_user_likes (userlike_yn, userboard_no, user_no)
VALUES ('Y', 3, 3);
INSERT INTO user_user_likes (userlike_yn, userboard_no, user_no)
VALUES ('Y', 3, 4);
INSERT INTO user_user_likes (userlike_yn, userboard_no, user_no)
VALUES ('Y', 2, 5);

/*사용자 게시판 기업 좋아요 테이블 더미데이터*/
INSERT INTO user_comp_likes (complike_yn, userboard_no, company_no)
VALUES ('Y', 1, 1);
INSERT INTO user_comp_likes (complike_yn, userboard_no, company_no)
VALUES ('Y', 2, 2);
INSERT INTO user_comp_likes (complike_yn, userboard_no, company_no)
VALUES ('Y', 3, 3);
INSERT INTO user_comp_likes (complike_yn, userboard_no, company_no)
VALUES ('Y', 2, 4);
INSERT INTO user_comp_likes (complike_yn, userboard_no, company_no)
VALUES ('Y', 3, 5);

/*기업 게시판 사용자 좋아요 테이블 더미데이터*/
INSERT INTO company_user_likes (com_userlikes_yn, compboard_no, company_no)
VALUES ('Y', 1, 1);
INSERT INTO company_user_likes (com_userlikes_yn, compboard_no, company_no)
VALUES ('Y', 2, 2);
INSERT INTO company_user_likes (com_userlikes_yn, compboard_no, company_no)
VALUES ('Y', 3, 3);
INSERT INTO company_user_likes (com_userlikes_yn, compboard_no, company_no)
VALUES ('Y', 3, 4);
INSERT INTO company_user_likes (com_userlikes_yn, compboard_no, company_no)
VALUES ('Y', 1, 5);

