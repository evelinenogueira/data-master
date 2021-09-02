mysql -u root -p

use datamaster

create table usuario (id varchar(255) not null, nome varchar (255) not null);

insert into usuario values ('1','Joao'),('2','Fabio'),('3','Alice');

show variables like 'port';

