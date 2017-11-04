# README

Do not use db:seed to import data,  drop the database then import the sql file in db folder.

Importing a MySQL database

To import a MySQL database, you need to use the mysql command. Here is the full command:

mysql -uUSERNAME -p DATABASE < backup.sql


Again, you will be prompted for the password of your MySQL user.



From project Dir.

cd db

rake db:destroy

mysql -uroot -p theyworkforyouje_development < theyworkforyouje_development.sql
