create database if not exists uerax;
use uerax;

create table t_user (
	`id` int(11) not null auto_increment,
	`nickname` varchar(50) not null default '' comment '�ǳ�',
	`username` varchar(50) not null default '' comment '�û���',
	`password` varchar(30) not null default '' comment '�û�����',
	`gender` tinyint(1) not null default '0' comment '�Ա�0ΪŮ��1Ϊ��',
	`avatar` varchar(128) not null default '' comment 'ͷ��',
	`birthday` date not null default '1970-01-01' comment '����',
	`sign` varchar(512) not null default '' comment 'ǩ��',
	`wechat` varchar(20) not null default '' comment '΢��',
	`create` TIMESTAMP not null default CURRENT_TIMESTAMP comment '��������',
	primary key(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�û���';

alter table t_user alter column `create` set default NOW();

alter table t_user add unique(username);

create table t_cource_classify (
	`id` int(11) not null auto_increment,
	`cource_name` varchar(50) not null default '' comment '�γ���',
	`cource_code` varchar(50) not null default '' comment '�ּ����',
	`parent_code` varchar(50) not null default '0' comment '����������,Ϊ0���ʾ��������',
	primary key(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�γ�����';

insert into t_cource_classify (cource_name, cource_code) values ('ǰ�˿���', 'fe');
insert into t_cource_classify (cource_name, cource_code) values ('��˿���', 'be');
insert into t_cource_classify (cource_name, cource_code) values ('�ƶ�����', 'mb');
insert into t_cource_classify (cource_name, cource_code) values ('���ݿ�', 'db');

insert into t_cource_classify (cource_name, cource_code, parent_code) values ('HTML', 'html', 'fe');
insert into t_cource_classify (cource_name, cource_code, parent_code) values ('Node.js', 'node', 'fe');
insert into t_cource_classify (cource_name, cource_code, parent_code) values ('Java', 'java', 'be');
insert into t_cource_classify (cource_name, cource_code, parent_code) values ('C', 'c', 'be');
insert into t_cource_classify (cource_name, cource_code, parent_code) values ('PHP', 'php', 'be');
insert into t_cource_classify (cource_name, cource_code, parent_code) values ('Android', 'android', 'mb');
insert into t_cource_classify (cource_name, cource_code, parent_code) values ('IOS', 'ios', 'mb');
insert into t_cource_classify (cource_name, cource_code, parent_code) values ('MySQL', 'mysql', 'db');
insert into t_cource_classify (cource_name, cource_code, parent_code) values ('Oracle', 'oracle', 'db');


create table t_cource (
	`id` int(11) not null auto_increment,
	`name` varchar(50) not null default '' COMMENT '�γ���',
	`classify` varchar(50) not null default '' comment '�γ����',
	`sub_classify` varchar(50) not null default '' comment '�����γ�',
	`creater` varchar(50) not null default '' comment '�����û�',
	`free` tinyint(1) not null default '1' comment '�Ƿ��շ� 0�շ� 1���',
	`price` int not null default 0 comment '�۸�',
	`introduce` varchar(255) not null default '' comment '�γ�����',
	`create_day` TIMESTAMP not null default CURRENT_TIMESTAMP comment '��������',
	primary key(`id`)
) engine=INNODB default charset=utf8 comment='�γ̱�';

create table t_user_cource (
	`id` int(11) not null auto_increment,
	`user_id` int(11) not null default '0' comment '�û�id',
	`classify` varchar(50) not null default '' comment '�γ����',
	`cource_id` int(11) not null default '0' comment '�γ�id',
	`cource_name` varchar(50) not null default '' comment '�γ���',
	primary key(`id`)
) engine=INNODB default charset=utf8 comment='�û�ѡ�α�';

CREATE TABLE `t_course_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL DEFAULT '0' COMMENT '�����γ�id',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '���½�id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '�½�����',
	`sort` int(11) NOT NULL default '1' comment '����',
  `url` varchar(255) NOT NULL DEFAULT '' comment '��Ƶ��ַ',
  `create_day` TIMESTAMP not null default CURRENT_TIMESTAMP comment '��������',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�γ��½ڱ�';

CREATE TABLE `t_carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '����',
  `picture` varchar(100) NOT NULL DEFAULT '' COMMENT 'ͼƬ',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '����',
  `enable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ񲥷�',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='��ҳ�ֲ���';