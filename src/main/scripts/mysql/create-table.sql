# Create Tables

# role
# ------------------------------------------------------------
DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# user
# ------------------------------------------------------------
DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT 'images/user.png',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY(email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# task
# ------------------------------------------------------------
DROP TABLE IF EXISTS `task`;

CREATE TABLE `task` (
  `task_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1200) NOT NULL,
  `date` date NOT NULL,
  `is_completed` boolean NOT NULL,
  `creator_name` varchar(255),
  `owner_id` bigint(20) DEFAULT NULL,
  CONSTRAINT `owner_id` FOREIGN KEY (`owner_id`) REFERENCES `user` (`user_id`),
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# user_role
# ------------------------------------------------------------
DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` int(11) NOT NULL,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
