/*알바*/
CREATE TABLE `tb_user` (
  `user_no` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `user_pw` varchar(100) NOT NULL,
  `user_nm` varchar(5) NOT NULL,
  `age` varchar(3) NOT NULL,
  `job` varchar(50) NOT NULL,
  `sex` varchar(1) NOT NULL,
  `career` varchar(2) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `addr` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `intro` varchar(200) DEFAULT NULL,
  `create_date` datetime DEFAULT current_timestamp(),
  `license_no` int(10) NOT NULL,
  `require_no` int(10) DEFAULT NULL,
  PRIMARY KEY (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8

/*회사*/
CREATE TABLE `tb_company` (
  `company_no` int(10) NOT NULL AUTO_INCREMENT,
  `manager_id` varchar(20) NOT NULL,
  `manager_pw` varchar(100) NOT NULL,
  `manager_nm` varchar(5) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `addr` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `kind` varchar(50) NOT NULL,
  `intro` varchar(200) DEFAULT NULL,
  `black_cnt` varchar(100) NOT NULL DEFAULT '0',
  `black_yn` varchar(1) NOT NULL DEFAULT 'N',
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`company_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8

/*자격증 면허증*/
CREATE TABLE `tb_license` (
  `file_no` int(10) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(100) NOT NULL,
  `file_orgin_name` varchar(100) NOT NULL,
  `file_path` varchar(200) NOT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `reg_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`file_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*알바 매칭 조건*/
CREATE TABLE `tb_require` (
  `require_no` int(10) NOT NULL AUTO_INCREMENT,
  `user_no` int(10) NOT NULL,
  `salary_hour` varchar(10) NOT NULL,
  `salary_day` varchar(10) NOT NULL,
  `search_type` varchar(10) NOT NULL COMMENT '일일/기간/요일',
  `search_date` varchar(10) DEFAULT NULL COMMENT '일일 날짜',
  `search_end` datetime DEFAULT NULL COMMENT '기간(종료 날짜)',
  `search_start` datetime DEFAULT NULL COMMENT '기간(시작 날짜)',
  `search_dow` varchar(10) DEFAULT NULL COMMENT '요일 (구분자"/" , 월-1/화-2/수-3/목-4/금-5/토-6/일-7)',
  `search_time` varchar(1) DEFAULT NULL COMMENT '시간 (1: 상관없음 / 2: 오전 / 3: 오후 / 4: 하루)',
  `location1` varchar(20) NOT NULL COMMENT '동/읍/면',
  `location2` varchar(20) NOT NULL COMMENT '동/읍/면',
  `location3` varchar(20) NOT NULL COMMENT '동/읍/면',
  `location4` varchar(20) NOT NULL COMMENT '동/읍/면',
  `location5` varchar(20) NOT NULL COMMENT '동/읍/면',
  `create_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`require_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8

/*알바 매칭 등록*/ 
CREATE TABLE `tb_search` (
  `search_no` int(10) NOT NULL AUTO_INCREMENT,
  `user_no` int(10) NOT NULL,
  `job` varchar(50) NOT NULL,
  `salary_hour` varchar(10) NOT NULL,
  `salary_day` varchar(10) NOT NULL,
  `search_type` varchar(10) NOT NULL,	-- 단기 / 장기
  `search_date` varchar(10) NOT NULL, -- 날짜
  `search_dow` varchar(10) NOT NULL,	-- 요일(day of week)
  `search_time` varchar(10) NOT NULL,	-- 시간(오전 , 오후, 하루, 야간, 상관 무, 특정 시간)
  `location` varchar(50) NOT NULL, -- 동/읍/면
  `create_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`search_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;



CREATE TABLE `tb_recruit` (
  `match_no` int(10) NOT NULL AUTO_INCREMENT,
  `user_no` int(0) NOT NULL,
  `user_pw` varchar(100) NOT NULL,
  `user_nm` varchar(5) NOT NULL,
  `age` varchar(3) NOT NULL,
  `job` varchar(50) NOT NULL,
  `sex` varchar(1) NOT NULL,
  `career` varchar(2) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `addr` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `intro` varchar(200) DEFAULT NULL,
  `create_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`match_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8
