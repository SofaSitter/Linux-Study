-- 1、创建数据库db_itheima
mysql> create database db_itheima default charset=utf8;

-- 2、显示所有数据库
mysql> show databases;

-- 3、只查询某个数据库的结构
mysql> show create database 数据库名称;

-- 4、修改数据库的编码格式
mysql> alter database db_itheima default charset=gbk;

-- 5、删除db_itheima数据库
mysql> drop database db_itheima;

-- 6、创建数据表tb_admin
mysql> create database db_itheima;
mysql> use db_itheima;
mysql> create table tb_admin(
	id tinyint,
	username varchar(20),
	password char(32)
) engine=innodb default charset=utf8;

-- 7、创建数据表tb_article
mysql> create table tb_article(
	id int,
	title varchar(50),
	author varchar(20),
	content text
) engine=innodb default charset=utf8;

-- 8、显示所有数据表
mysql> show tables;
mysql> show create table 数据表名称;
mysql> desc 数据表名称;

-- 9、添加addtime字段
mysql> alter table tb_article add addtime date after content;

-- 10、修改字段名称与类型
mysql> alter table tb_admin change username user varchar(40);

-- 11、仅修改字段类型
mysql> alter table tb_admin modify user varchar(20);

-- 12、删除某个字段
mysql> alter table tb_article drop addtime;

-- 13、修改数据表名称（把tb_article更改为tb_news）
mysql> rename table tb_article to tb_news;
mysql> show tables;

-- 14、重命名的同时移动数据表到指定的数据表（了解）
mysql> create database db_itcast;
mysql> rename table db_itheima.tb_news to db_itcast.tb_article;

-- 15、删除tb_admin数据表
mysql> use db_itheima;
mysql> drop table tb_admin;

-- 16、数据的插入操作
mysql> use db_itheima;
mysql> create table tb_user(
	id int,
	username varchar(20),
	age tinyint unsigned,
	gender enum('男','女','保密'),
	address varchar(255)
) engine=innodb default charset=utf8;

-- 17、插入数据
mysql> insert into tb_user values (1,'李向阳',24,'男','广东省广州市');
mysql> insert into tb_user(id,username,age) values (2,'马鹏',23);

-- 18、查询数据
案例：查询tb_user表中的所有记录
mysql> select * from tb_user;

案例：查询tb_user表中的id，username以及age字段中对应的数据信息
mysql> select id,username,age from tb_user;

案例：只查询id=2的小伙伴信息
mysql> select * from tb_user where id=2;

案例：查询年龄大于23岁的小伙伴信息
mysql> select * from tb_user where age>23;

-- 19、修改数据
案例：修改username='马鹏'这条记录，将其性别更新为男，家庭住址更新为广东省深圳市
mysql> update tb_user set gender='男',address='广东省深圳市' where username='马鹏';

案例：今年是2020年，假设到了2021年，现在存储的学员年龄都差1岁，整体进行一次更新
mysql> update tb_user set age=age+1;

-- 20、删除数据（删除与清空）

