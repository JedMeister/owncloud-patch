CREATE USER 'owncloud-usr'@'localhost' IDENTIFIED BY 'not-set';

GRANT ALL PRIVILEGES ON `owncloud` . * TO 'owncloud-usr'@'localhost';
