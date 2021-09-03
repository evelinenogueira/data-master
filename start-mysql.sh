apt-get update
apt-get install -y wget

wget https://web.stanford.edu/class/archive/cs/cs109/cs109.1166/stuff/titanic.csv

mv titanic.csv /usr/titanic.csv

mysql -u root -p

use datamaster;

create table titanic (
survived varchar(255) not null
,pclass varchar(255) not null
,name varchar(255) not null
,age int not null
,sibilings_spouses_aboard int not null
,parents_children_aboard int not null
,fare varchar(10) not null);

SET GLOBAL local_infile=1;

quit

mysql --local_infile=1 -u root -p

LOAD DATA LOCAL INFILE "/usr/titanic.csv" INTO TABLE titanic FIELDS TERMINATED BY  ',' LINES TERMINATED BY '\n' IGNORE 1 LINES (survived,pclass,name,age,sibilings_spouses_aboard,parents_children_aboard,fare);