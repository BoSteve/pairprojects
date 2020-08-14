BEGIN TRANSACTION;


CREATE TABLE procedures
(
procedures_id serial,
procedures_name varchar(100) not null,
constraint pk_procedures primary key(procedures_id)
);

CREATE TABLE pet_type
(
pet_type serial,
species varchar(64) not null,
constraint pk_pet_type primary key (pet_type)
);


CREATE TABLE pet
(
pet_id serial,
pet_name varchar(64) not null,
pet_type int not null,
pet_age int not null,
constraint pk_pet primary key (pet_id),
constraint fk_pet_type foreign key (pet_type) references pet_type (pet_type)
);

CREATE TABLE owner_name
(
owner_id serial,
first_name varchar(64) not null,
last_name varchar(64) not null,
pet_id int not null,
constraint pk_owner_name primary key (owner_id),
constraint fk_pet_id foreign key (pet_id) references pet (pet_id)
);




CREATE TABLE visit
(
visit_id serial,
pet_id int not null,
procedures_id int not null,
visit_date timestamp not null,
constraint pk_visit primary key (visit_id),
constraint fk_pet_id foreign key (pet_id) references pet (pet_id),
constraint fk_procedures_id foreign key (procedures_id) references procedures (procedures_id)
);

END;