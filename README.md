# Dar Privilegios al cierto host y/o a todos

SELECT host FROM mysql.user WHERE User = 'root';

```sql
CREATE USER 'root'@'%' IDENTIFIED BY 'nicolas';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
FLUSH PRIVILEGES;
```
