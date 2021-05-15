-- 1、整数类型演示
mysql> use db_itheima;
mysql> create table tb_student(
	id mediumint unsigned not null auto_increment,
	username varchar(20),
	age tinyint unsigned,
	mobile char(11),
	primary key(id)
) engine=innodb default charset=utf8;

-- 2、小数类型演示
mysql> use db_itheima;
mysql> create table tb_staff(
	id smallint unsigned not null auto_increment,
	username varchar(20),
	salary decimal(11,2),
	addtime date,
	primary key(id)
) engine=innodb default charset=utf8;

-- 3、CHAR定长类型演示
mysql> use db_itheima;
mysql> create table tb_admin(
	id tinyint unsigned not null auto_increment,
	username varchar(10),
	password char(32),
	primary key(id)
) engine=innodb default charset=utf8;

mysql> insert into tb_admin values (null,'admin',md5('admin888'));

-- 4、VARCHAR变长类型演示
mysql> use db_itheima;
mysql> create table tb_news(
	id int not null auto_increment,
	title varchar(80),
	description varchar(255),
	addtime date,
	primary key(id)
) engine=innodb default charset=utf8;

-- 5、TEXT文本类型演示
mysql> use db_itheima;
mysql> create table tb_goods(
  id int not null auto_increment,
  name varchar(80),
  price decimal(11,2),
  content text,
  primary key(id)
) engine=innodb default charset=utf8;

-- 6、日期时间格式演示
mysql> use db_itheima;
mysql> create table tb_article1(
	id int not null auto_increment,
	title varchar(80),
	description varchar(255),
	addtime datetime,
	primary key(id)
) engine=innodb default charset=utf8;

mysql> create table tb_article2(
	id int not null auto_increment,
	title varchar(80),
	description varchar(255),
	addtime timestamp,
	primary key(id)
) engine=innodb default charset=utf8;