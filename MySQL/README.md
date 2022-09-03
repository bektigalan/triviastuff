## how to prevent error "Error Code: 1118. Row size too large (> 8126). Changing some columns to TEXT or BLOB may help"  
```
SET GLOBAL innodb_strict_mode = 0;
SET innodb_strict_mode = 0;
```

## create user
```
CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';
```
## grant privileges
```
GRANT ALL PRIVILEGES ON * . * TO 'newuser'@'localhost';
FLUSH PRIVILEGES;
```
## show grants
```
SHOW GRANTS FOR 'username'@'localhost';
```
## alter user
```
ALTER USER 'username'@'localhost' IDENTIFIED BY 'NEW_USER_PASSWORD';
```
## drop user
```
DROP USER 'username'@'localhost';
```