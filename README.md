# README

Do not use `db:seed` to `import data`,

Importing a MySQL database

To import a MySQL database, you need to use the mysql command. Here is the full command:

* <b>mysql -uUSERNAME -p DATABASE < backup.sql</b>


Again, you will be prompted for the password of your MySQL user.


* <b>From project Dir.</b>

```
cd db
rake db:drop
rake db:create
mysql -uroot -p theyworkforyouje_development < theyworkforyouje_development.sql
```