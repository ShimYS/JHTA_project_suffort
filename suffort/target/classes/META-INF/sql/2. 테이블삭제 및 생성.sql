/*테이블 삭제하기*/
DROP TABLE careers;
DROP TABLE licenses;
DROP TABLE user_board_tags;
DROP TABLE company_board_tags;
DROP TABLE community_tags;
DROP TABLE tags;
DROP TABLE categories;
DROP TABLE community_contents_tags;
DROP TABLE community_imgs;
DROP TABLE community_writings;
DROP TABLE community_files;
DROP TABLE community_contents;
DROP TABLE community_guests;
DROP TABLE company_user_likes;
DROP TABLE user_comp_likes;
DROP TABLE user_user_likes;
DROP TABLE user_total_boards;
DROP TABLE company_total_boards;
DROP TABLE communities;
DROP TABLE users;
DROP TABLE companies;

/**********************************/

/* Table Name: 기업정보 */

/**********************************/

CREATE TABLE companies(
		company_no INT(5) NOT NULL primary KEY auto_increment,
		company_id VARCHAR(100) NOT NULL UNIQUE,		
		company_password VARCHAR(50) NOT NULL,
		company_name VARCHAR(100) NOT NULL,
		company_content longtext DEFAULT '안녕하세요',
		company_actived CHAR(1) DEFAULT 'Y',
		company_registered_date DATE DEFAULT sysdate(),
		company_logo VARCHAR(100),
		company_url VARCHAR(1000) NOT NULL,
		company_size VARCHAR(10) DEFAULT '일반' NOT NULL,
		company_address VARCHAR(100) NOT NULL,
		company_income DOUBLE DEFAULT 0.0,
		company_started_date DATE
);

 

/**********************************/

/* Table Name: 회원정보 */

/**********************************/

CREATE TABLE users(
		user_no INT NOT NULL primary KEY auto_increment,
		user_id VARCHAR(50) NOT NULL,
		login_way VARCHAR(500) NOT NULL UNIQUE,
		user_name VARCHAR(50),
		user_img VARCHAR(1000),
		user_gender CHAR(1) DEFAULT 'M',
		user_birth DATE,
		user_git_addr VARCHAR(1000),
		user_email VARCHAR(256),
		user_deleted CHAR(1) DEFAULT 'N',
		user_actived CHAR(1) DEFAULT 'Y',
		user_gratuation VARCHAR(50),
		user_registered_date DATE DEFAULT sysdate()
);

 

/**********************************/

/* Table Name: 경력 테이블 */

/**********************************/

CREATE TABLE careers(
		career_no INT NOT NULL primary KEY auto_increment,
		career_company_name VARCHAR(100) NOT NULL unique,
		career_month INT NOT NULL,
		career_job_content VARCHAR(500) NOT NULL,
		career_job_position VARCHAR(50) NOT NULL,
		user_no INT not null
);
ALTER TABLE careers ADD CONSTRAINT IDX_careers_FK0 FOREIGN KEY (user_no) REFERENCES users (user_no);


/**********************************/

/* Table Name: 자격정보 */

/**********************************/

CREATE TABLE licenses(
		license_no INT NOT NULL primary KEY auto_increment,
		license_name VARCHAR(100) NOT NULL,
		license_grade VARCHAR(50),
		license_company VARCHAR(100) NOT NULL,
		license_registered_date DATE NOT NULL,
		user_no INT not null
);
ALTER TABLE licenses ADD CONSTRAINT IDX_licenses_FK0 FOREIGN KEY (user_no) REFERENCES users (user_no);
 

/**********************************/

/* Table Name: 카테고리 */

/**********************************/

CREATE TABLE categories(
		category_no INT NOT NULL primary KEY auto_increment,
		category_name VARCHAR(50) NOT NULL
);


/**********************************/

/* Table Name: 태그모음 */

/**********************************/

CREATE TABLE tags(
		tag_no INT NOT NULL primary KEY auto_increment,
		tag_name VARCHAR(100) NOT NULL UNIQUE,
		category_no INT not null
);
ALTER TABLE tags ADD CONSTRAINT IDX_tags_FK0 FOREIGN KEY (category_no) REFERENCES categories (category_no);
 

/**********************************/

/* Table Name: 회원 전체게시판 */

/**********************************/

CREATE TABLE user_total_boards(
		userboard_no INT NOT NULL primary KEY auto_increment,
		userboard_title VARCHAR(300) NOT NULL,
		userboard_content longtext NOT NULL,
		userboard_git VARCHAR(100),
		userboard_img VARCHAR(300) DEFAULT 'gray.jpg',
		userboard_actived CHAR(1) DEFAULT 'N',
		userboard_warnings INT DEFAULT 0,
		userboard_user_likes INT DEFAULT 0,
		userboard_comp_likes INT DEFAULT 0,
		userboard_registered_date DATE DEFAULT sysdate(),
		user_no INT not null
);
ALTER TABLE user_total_boards ADD CONSTRAINT IDX_user_total_boards_FK0 FOREIGN KEY (user_no) REFERENCES users (user_no);
 

/**********************************/

/* Table Name: 기업 전체게시판 */

/**********************************/

CREATE TABLE company_total_boards(
		compboard_no INT NOT NULL PRIMARY KEY auto_increment,
		compboard_title VARCHAR(300) NOT NULL,
		compboard_content longtext NOT NULL,
		compboard_actived CHAR(1) DEFAULT 'N',
		compboard_warnings INT DEFAULT 0,
		compboard_user_likes INT DEFAULT 0,
		compboard_registered_date DATE DEFAULT sysdate(),
		company_no INT not null
);
ALTER TABLE company_total_boards ADD CONSTRAINT IDX_company_total_boards_FK0 FOREIGN KEY (company_no) REFERENCES companies (company_no);
 

/**********************************/

/* Table Name: 사용자 게시판 태그 */

/**********************************/

CREATE TABLE user_board_tags(
		usertag_no INT NOT NULL PRIMARY KEY auto_increment,
		userboard_no INT not null,
		tag_no INT not null
);
ALTER TABLE user_board_tags ADD CONSTRAINT IDX_user_board_tags_FK0 FOREIGN KEY (userboard_no) REFERENCES user_total_boards (userboard_no);
ALTER TABLE user_board_tags ADD CONSTRAINT IDX_user_board_tags_FK1 FOREIGN KEY (tag_no) REFERENCES tags (tag_no);
 

/**********************************/

/* Table Name: 기업게시판 태그 */

/**********************************/

CREATE TABLE company_board_tags(
		comptag_no INT NOT NULL PRIMARY KEY auto_increment,
		compboard_no INT REFERENCES company_total_boards (compboard_no),
		tag_no INT not null

);
ALTER TABLE company_board_tags ADD CONSTRAINT IDX_company_board_tags_FK0 FOREIGN KEY (compboard_no) REFERENCES company_total_boards (compboard_no);
ALTER TABLE company_board_tags ADD CONSTRAINT IDX_company_board_tags_FK1 FOREIGN KEY (tag_no) REFERENCES tags (tag_no);
 

/**********************************/

/* Table Name: 커뮤니티 정보 */

/**********************************/

CREATE TABLE communities(
		commu_no INT NOT NULL PRIMARY KEY auto_increment,
		commu_limitnum INT DEFAULT 8,
		commu_img VARCHAR(300) DEFAULT 'gray.jpg',
		commu_title VARCHAR(300) NOT NULL,
		commu_password VARCHAR(50),
		user_no INT not null,
		commu_registered_date DATE DEFAULT sysdate(),
		commu_actived CHAR(1) DEFAULT 'N',
		commu_range VARCHAR(10) DEFAULT '전체'
);
ALTER TABLE communities ADD CONSTRAINT IDX_communities_FK0 FOREIGN KEY (user_no) REFERENCES users (user_no);
 

/**********************************/

/* Table Name: 커뮤니티 태그 */

/**********************************/

CREATE TABLE community_tags(
		commtag_no INT NOT NULL PRIMARY KEY auto_increment,
		tag_no INT not null,
		commu_no INT not null
);
ALTER TABLE community_tags ADD CONSTRAINT IDX_community_tags_FK0 FOREIGN KEY (tag_no) REFERENCES tags (tag_no);
ALTER TABLE community_tags ADD CONSTRAINT IDX_community_tags_FK1 FOREIGN KEY (commu_no) REFERENCES communities (commu_no);
 
/*여기서부터 확인하기*/
/**********************************/
/*중요*/
/* Table Name: 커뮤니티 참여자 */
/*commu_no,user_no - 기본키*/

/**********************************/

CREATE TABLE community_guests(
		commu_no INT not null,
		user_no INT not null,
		guest_grade VARCHAR(5) DEFAULT '일반' NOT NULL,
		guest_registered_date DATE DEFAULT sysdate(),
		guest_actived_date DATE DEFAULT sysdate()
);
ALTER TABLE community_guests ADD CONSTRAINT IDX_community_guests_PK PRIMARY KEY (commu_no, user_no);
ALTER TABLE community_guests ADD CONSTRAINT IDX_community_guests_FK0 FOREIGN KEY (commu_no) REFERENCES communities (commu_no);
ALTER TABLE community_guests ADD CONSTRAINT IDX_community_guests_FK1 FOREIGN KEY (user_no) REFERENCES users (user_no);
 

/**********************************/

/* Table Name: 커뮤니티 컨텐츠 모음 */

/**********************************/

CREATE TABLE community_contents(
		contents_no INT NOT NULL PRIMARY KEY auto_increment, 
		contents_registered_date DATE DEFAULT sysdate(),
		contents_updated_date DATE DEFAULT sysdate(),
		contents_actived CHAR(1) DEFAULT 'N',
		commu_no INT not null,
		user_no INT not null
);
ALTER TABLE community_contents ADD CONSTRAINT IDX_community_contents_FK0 FOREIGN KEY (commu_no) REFERENCES community_guests (commu_no);
ALTER TABLE community_contents ADD CONSTRAINT IDX_community_contents_FK1 FOREIGN KEY (user_no) REFERENCES users (user_no);

/**********************************/

/* Table Name: 커뮤니티 파일 */

/**********************************/

CREATE TABLE community_files(
		file_no BIGINT NOT NULL PRIMARY KEY,
		file_name VARCHAR(2000) NOT NULL,
		contents_no INT not null
);
ALTER TABLE community_files ADD CONSTRAINT IDX_community_files_FK0 FOREIGN KEY (contents_no) REFERENCES community_contents (contents_no);
 

/**********************************/

/* Table Name: 커뮤니티 내용(글) */

/**********************************/

CREATE TABLE community_writings(
		writing_no BIGINT NOT NULL PRIMARY KEY,
		writing_talk VARCHAR(2000) NOT NULL,
		contents_no INT not null
);
ALTER TABLE community_writings ADD CONSTRAINT IDX_community_writings_FK0 FOREIGN KEY (contents_no) REFERENCES community_contents (contents_no);
 

/**********************************/

/* Table Name: 커뮤니티 이미지 */

/**********************************/

CREATE TABLE community_imgs(
		img_no BIGINT NOT NULL PRIMARY KEY,
		img_name VARCHAR(1000) NOT NULL,
		contents_no INT not null
);
ALTER TABLE community_imgs ADD CONSTRAINT IDX_community_imgs_FK0 FOREIGN KEY (contents_no) REFERENCES community_contents (contents_no);
 

/**********************************/

/*중요*/
/* Table Name: 커뮤니티 컨텐츠 태그 */
/*contentstag_no - 기본키*/
/*contentstag_name - unique*/
/*contents_no - 기본키,unique*/

/**********************************/

CREATE TABLE community_contents_tags(
		contentstag_no BIGINT NOT NULL PRIMARY KEY,
		contentstag_name VARCHAR(10) NOT NULL,
		contents_no INT not null UNIQUE
);
ALTER TABLE community_contents_tags ADD CONSTRAINT IDX_community_contents_tags_FK0 FOREIGN KEY (contents_no) REFERENCES community_contents (contents_no);

/**********************************/
/* Table Name: 사용자 게시판 사용자 좋아요 */
/**********************************/
CREATE TABLE user_user_likes(
		userlike_no INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		userlike_yn CHAR(1) DEFAULT 'N',
		userboard_no INT,
		user_no INT
);
ALTER TABLE user_user_likes ADD CONSTRAINT IDX_user_user_likes_FK0 FOREIGN KEY (userboard_no) REFERENCES user_total_boards (userboard_no);
ALTER TABLE user_user_likes ADD CONSTRAINT IDX_user_user_likes_FK1 FOREIGN KEY (user_no) REFERENCES users (user_no);


/**********************************/
/* Table Name: 사용자 게시판 기업 좋아요 */
/**********************************/
CREATE TABLE user_comp_likes(
		complike_no INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		complike_yn CHAR(1) DEFAULT 'N',
		userboard_no INT,
		company_no INT
);
ALTER TABLE user_comp_likes ADD CONSTRAINT IDX_user_comp_likes_FK0 FOREIGN KEY (userboard_no) REFERENCES user_total_boards (userboard_no);
ALTER TABLE user_comp_likes ADD CONSTRAINT IDX_user_comp_likes_FK1 FOREIGN KEY (company_no) REFERENCES companies (company_no);


/**********************************/
/* Table Name: 기업 게시판 사용자 좋아요 */
/**********************************/
CREATE TABLE company_user_likes(
		com_userlikes_no INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		com_userlikes_yn CHAR(1) DEFAULT 'N',
		compboard_no INT,
		company_no INT
);
ALTER TABLE company_user_likes ADD CONSTRAINT IDX_company_user_likes_FK0 FOREIGN KEY (compboard_no) REFERENCES company_total_boards (compboard_no);
ALTER TABLE company_user_likes ADD CONSTRAINT IDX_company_user_likes_FK1 FOREIGN KEY (company_no) REFERENCES companies (company_no);

show tables;
