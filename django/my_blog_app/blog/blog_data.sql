CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4;

CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (1,'Can add log entry',1,'add_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (2,'Can change log entry',1,'change_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (3,'Can delete log entry',1,'delete_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (4,'Can view log entry',1,'view_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (5,'Can add permission',2,'add_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (6,'Can change permission',2,'change_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (7,'Can delete permission',2,'delete_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (8,'Can view permission',2,'view_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (9,'Can add group',3,'add_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (10,'Can change group',3,'change_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (11,'Can delete group',3,'delete_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (12,'Can view group',3,'view_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (13,'Can add user',4,'add_user');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (14,'Can change user',4,'change_user');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (15,'Can delete user',4,'delete_user');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (16,'Can view user',4,'view_user');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (17,'Can add content type',5,'add_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (18,'Can change content type',5,'change_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (19,'Can delete content type',5,'delete_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (20,'Can view content type',5,'view_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (21,'Can add session',6,'add_session');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (22,'Can change session',6,'change_session');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (23,'Can delete session',6,'delete_session');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (24,'Can view session',6,'view_session');
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4;

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES (1,'pbkdf2_sha256$216000$eis9T6Zt9ZSq$6KDpYYmfN3BbCjEeefzriCe1tUm2tK0K/yscrQL81y4=',NULL,1,'askdba','','','alkin@planetscale.com',1,1,'2020-10-15 08:16:07.389559');
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4;

CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4;

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (1,'admin','logentry');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (3,'auth','group');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (2,'auth','permission');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (4,'auth','user');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (5,'contenttypes','contenttype');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (6,'sessions','session');
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4;

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (1,'contenttypes','0001_initial','2020-10-15 08:15:31.387167');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (2,'auth','0001_initial','2020-10-15 08:15:31.449125');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (3,'admin','0001_initial','2020-10-15 08:15:31.574169');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (4,'admin','0002_logentry_remove_auto_add','2020-10-15 08:15:31.613846');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (5,'admin','0003_logentry_add_action_flag_choices','2020-10-15 08:15:31.619959');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (6,'contenttypes','0002_remove_content_type_name','2020-10-15 08:15:31.672058');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (7,'auth','0002_alter_permission_name_max_length','2020-10-15 08:15:31.695176');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (8,'auth','0003_alter_user_email_max_length','2020-10-15 08:15:31.711047');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (9,'auth','0004_alter_user_username_opts','2020-10-15 08:15:31.717951');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (10,'auth','0005_alter_user_last_login_null','2020-10-15 08:15:31.740725');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (11,'auth','0006_require_contenttypes_0002','2020-10-15 08:15:31.743050');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (12,'auth','0007_alter_validators_add_error_messages','2020-10-15 08:15:31.749561');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (13,'auth','0008_alter_user_username_max_length','2020-10-15 08:15:31.774597');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (14,'auth','0009_alter_user_last_name_max_length','2020-10-15 08:15:31.799632');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (15,'auth','0010_alter_group_name_max_length','2020-10-15 08:15:31.814492');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (16,'auth','0011_update_proxy_permissions','2020-10-15 08:15:31.820778');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (17,'auth','0012_alter_user_first_name_max_length','2020-10-15 08:15:31.849334');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (18,'sessions','0001_initial','2020-10-15 08:15:31.858488');
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4;



