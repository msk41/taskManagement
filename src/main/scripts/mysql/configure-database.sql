# Create Databases
CREATE DATABASE taskManager_dev;
CREATE DATABASE taskManager_prod;

# Create database service accounts
CREATE USER 'dev_user'@'localhost' IDENTIFIED BY 'dev_user';
CREATE USER 'dev_user'@'%' IDENTIFIED BY 'dev_user';
CREATE USER 'prod_user'@'localhost' IDENTIFIED BY 'prod_user';
CREATE USER 'prod_user'@'%' IDENTIFIED BY 'prod_user';

# Database grants
GRANT SELECT, INSERT, UPDATE, DELETE ON taskManager_dev.* to 'dev_user'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON taskManager_dev.* to 'dev_user'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON taskManager_prod.* to 'prod_user'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON taskManager_prod.* to 'prod_user'@'%';
