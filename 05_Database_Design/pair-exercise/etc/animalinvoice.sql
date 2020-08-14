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
street_address varchar(64) not null,
city varchar(64) not null,
state_prov varchar(64) not null,
zipcode varchar(64) not null,
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

CREATE TABLE invoice
(
invoice_id serial,
invoice_date timestamp not null,
owner_id int not null,
visit_id int not null,
tax_amount int not null,
constraint pk_invoice_id primary key (invoice_id),
constraint fk_owner_id foreign key (owner_id) references owner_name (owner_id),
constraint fk_visit_id foreign key (visit_id) references visit (visit_id)
);

END;