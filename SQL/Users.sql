
CREATE USER 'simpleuser'@'%'IDENTIFIED BY 'simpepassword';
 GRANt SELECT ON superleague.* TO 'simpleuser'@'%';
 
 CREATE USER 'admin'@'localhost'identified BY 'mypass';
 GRANT INSERT ,UPDATE, DELETE ON superleague.* TO 'truser'@'localhost';
 
 CREATE USER 'programmer'@'localhost' IDENTIFIED BY 'superpass';
 GRANT ALL PRIVILEGES ON superleague.* TO 'programmer'@'localhost';