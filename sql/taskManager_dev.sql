# ************************************************************
# Sequel Pro SQL dump
# Version 5416
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.22)
# Database: taskManager_dev
# Generation Time: 2021-05-22 03:59:16 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;

INSERT INTO `role` (`role_id`, `role`)
VALUES
    (1,'ADMIN'),
    (2,'USER');

/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT 'images/user.png',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`user_id`, `name`, `email`, `password`, `photo`)
VALUES
  (1,'admin','admin@mail.com','$2a$10$8V7YOPxJEa3Q7OZ9fEBeauh/xr6RiM0.A4NiP/4yB09rfyapYV1cu','images/user.png'),
  (2,'Manager','manager@mail.com','$2a$10$QvKm9VkSATgNPdD6JvIp1.4Y7jNrDY6T.FT3bqKeZJI733R7DI3my','images/user.png'),
  (3,'Mark','mark@mail.com','$2a$10$XdJlpE.Mo6yh.dyzZlPqEeIBGNJr8xXOacqqmKqqpK5lm78xvuRz2','images/user.png'),
  (4,'Ann','ann@mail.com','$2a$10$GKYVKRlYM0ulHSgZa3KqP.9vmFLG84YwSeHD5tOHmkQusWFbHgNeW','images/user.png'),
  (5,'Ralf','ralf@mail.com','$2a$10$HRL196NRMilwYleCaXrij.LDMRb//E5GFzNCxRV1WbaCKZvixedoO','images/user.png'),
  (6,'Kate','kate@mail.com','$2a$10$1vQBrI5Iq46Q4OBG29UpTOy553a4GUBb6NSsC2a3LBYYEgb8GnTXK','images/user.png'),
  (7,'Tom','tom@mail.com','$2a$10$RwuTFdg9SmAsvgal3QBm1OfAJb.LVOHplaR4ZuwhpV8UctPd6dTqa','images/user.png');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `task`;

CREATE TABLE `task` (
  `task_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1200) NOT NULL,
  `date` date NOT NULL,
  `is_completed` tinyint(1) NOT NULL,
  `creator_name` varchar(255) DEFAULT NULL,
  `owner_id` bigint DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `owner_id` FOREIGN KEY (`owner_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;

INSERT INTO `task` (`task_id`, `name`, `description`, `date`, `is_completed`, `creator_name`, `owner_id`)
VALUES
    (1,'Collect briefing document ','Setup first meeting with client. Collect basic data about the client. Define and collect briefing document from client.','2021-04-06',1,'Mark',3),
    (2,'Define project questionnaire ','Define and send project questionnaire to the client and wait for the client’s response. Iterate on doubts you have until everybody is in agreement. Finalize project questionnaire from client.','2021-04-16',1,'Ann',4),
    (3,'Research client’s company and industry','Research client’s company to understand their brand, the way they communicate, their demographics, target audience. Research client’s industry to find ways of communicating specifically to the industry, strengths and weaknesses, trends and other industry specifics.','2021-04-26',1,'Ralf',5),
    (4,'Get quotation for project','Get quotation for development effort for project. Estimate design work with designers. Get quotation for copy/content or estimate work with your copywriters.  Get quotation for photography and video production or estimate effort involved.','2021-05-06',1,'Kate',6),
    (5,'Get quotation for hosting and domain','Get quotation for hosting and domain, particularly if specialized hosting is involved such as VPS hosting, cloud hosting, or special hosting or environment requirements.','2021-05-11',0,'Manager',6),
    (6,'Check the quality of each content element','Quality assure each piece of content you have outsourced or bought – and ask for changes where necessary. Populate the website content with the various content items you have agreed with the client.','2021-05-14',0,'Manager',3),
    (7,'Define a Contact Us page and social media details','Define a Contact Us page with correct client details and a map. Populate links and icongraphy with links to relevant social media details. Create a link to your website in the footer (make sure it has been agreed with the client to do so).','2021-05-15',0,'Manager',3),
    (8,'Check all web copywriting','Make sure web copywriting has been proofread and ran through a spelling and grammar checker to check for correctness. Use online tools such as Reverso, or Spellcheckplus.com. Check that generic content, such as lorem ipsum, has been properly removed and replaced.','2021-05-16',0,'Manager',4),
    (9,'Check all images and videos','See that all images are in the correct places, smushed, formatted, width and height specified and working on all devices. Confirm that videos and audio files are in the correct places, formatted and working on all devices.','2021-05-17',0,'Manager',4),
    (10,'Check all linked content','Test all linked content, such as case studies, ebooks, and whitepapers, and verify that they are correctly linked. Test to see that all internal links across web pages are working properly. Ensure that company logo is linked to the homepage.','2021-05-18',0,'Manager',6),
    (11,'Check Contact Us and other Forms','Ensure that Contact Us and other forms are submitting data properly. If the form is sent to an email address ensure that email is received on a mailbox that is monitored, or ensure that content is correctly stored in your database. Verify the Thank-you message or page displayed after form is submitted. Check that Auto-responders are working properly and text in emails has been proofed.','2021-05-19',0,'Kate',6),
    (12,'Check all external links','External links across web pages are working properly, and open in a new tab (Fix any broken links using this tool). Ensure that Social media share icons are working properly – that there is a good image for sharing and that the description for sharing is appropriate. Correct your metadata as necessary to ensure social media sharing is working ok.','2021-05-20',0,'Ann',4),
    (13,'Check the 404 page and redirects','Try a non-existing address on your page to check the 404 page and 404 redirect pages are in place. Choose www vs no-www and make sure that ONLY one of them is working to ensure you don’t get penalized for duplicate content. After choosing one, make sure one redirects to the other.','2021-05-21',0,'Ralf',5),
    (14,'Check if website is mobile-friendly','Make sure that viewport meta tag is used. Check that  website is mobile-friendly with at least a MobileOk score of 75. Check if Google sees your page as Mobile-Friendly. Make sure that correct input types for email, phone and URL input form fields are used to ensure these are rendered correctly on mobile phones.','2021-05-22',0,'Manager',2),
    (15,'Test website on emulators and real devices','Check how the site looks on emulators such as ipadpeek, screenfly, mobilephonesimulator. Test the site using real devices you have accessible to you or use opendevicelab.com.','2021-05-24',0,'Manager',NULL),
    (16,'Check page titles, meta descriptions and keywords','Check that all pages have unique page titles (with a recommended length of fewer than 70 characters, including any keywords). Check that all pages have unique meta descriptions (with a recommended length of fewer than 156 characters, including keywords). Verify that pages have your chosen keywords included without any keyword stuffing (do not over-emphasize particular keywords).','2021-05-26',0,'Manager',NULL),
    (17,'Check page URLs','See that all page URLs consistently reflect site information architecture. If you have had another older website, make sure you have 301 redirects in place for all old URLs (redirecting old pages to new ones).','2021-05-28',0,'Manager',NULL),
    (18,'Minify and optimize files','Minify javascript and CSS files. Optimize the size of images and replace the existing images with the optimized images. Specify image dimensions for each image. Enable gzip compression on your hosting server.','2021-05-30',0,'Manager',NULL),
    (19,'Register social media properties','Create cover images for Social Media such as Facebook, Twitter, LinkedIn company page, Pinterest, Instagram or others as necessary. Register all social media properties and get them set up with profile images, cover pages, links back to the website.','2021-06-01',0,'Manager',NULL),
    (20,'Send the finished site to the client','Send the finished site to the client and get feedback. Fix and change any requests by client. Give access to client to all accounts created on their behalf. Send updates to client and wait for client sign-off.','2021-06-03',0,'Manager',NULL);

/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `user_id` bigint NOT NULL,
  `role_id` int NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;

INSERT INTO `user_role` (`user_id`, `role_id`)
VALUES
    (1,1),
    (2,1),
    (3,2),
    (4,2),
    (5,2),
    (6,2),
    (7,2);

/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
