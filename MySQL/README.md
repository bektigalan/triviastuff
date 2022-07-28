## how to prevent error "Error Code: 1118. Row size too large (> 8126). Changing some columns to TEXT or BLOB may help"  
```
SET GLOBAL innodb_strict_mode = 0;
SET innodb_strict_mode = 0;
```