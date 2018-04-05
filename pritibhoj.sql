create table notification(
id serial primary key, notification_type varchar(50),
notification text, notitification_link varchar(50),
creation_time timestamp default current_timestamp
);

create table forget(
id serial primary key,
key varchar(50), creation_time timestamp default current_timestamp,
is_active boolean
);

create table phone_verification(
id serial primary key,
phone_no varchar(50), key_code varchar(50),
creation_time timestamp default current_timestamp,
verified boolean,is_active boolean
);

create table user_info(
email varchar(50) primary key,
sn serial, date_joined timestamp default current_timestamp,
first_name varchar(50), is_active boolean,
is_staff boolean, is_superuser boolean, last_login varchar(50),
 username varchar(50), password varchar(50)
);


create table email_verification(
id serial primary key, email varchar(50),
key_code varchar(50), creation_time timestamp default current_timestamp,
verified boolean, is_active boolean
);

create table phone(
id serial primary key, country_code varchar(20),
 number varchar(20) 
);



create table user_profile(
id serial primary key, about_me text,
 is_email_verified bool, phone varchar(20),
 photo bytea, response_rate varchar(50), 
response_time date, last_notification_view date
);



create table review ( 
id serial primary key, 
booking bool, review text, 
rating_attribute_1 int, rating_attribute_2 int, 
rating_attribute_3 int, rating_attribute_4 int, 
rating_attribute_5 int
);

create table price_package(
id serial primary key,user_price real,final_price real,
denomination varchar(50),description text,max_occupancy int,
is_active boolean,availability boolean);


create table availability(
id serial primary key, start_on varchar(50),
end_at varchar(50), repeat_type varchar(50),
repeat_until varchar(50),repeat_on_mon boolean,
repeat_on_tue boolean,repeat_on_wed boolean,
repeat_on_thu boolean,repeat_on_fri boolean,
repeat_on_sat boolean,repeat_on_sun boolean
);


create table venue(
id serial primary key,photo bytea,short_desc text,
description text,music_desc text,food_desc text,drinks_desc text,
capacity int,capacity_desc text,accessibility_desc text,
longtitude varchar(20),latitude varchar(20),directions varchar(100),
venue_rules text,is_live boolean,is_active boolean
);
create table venue_extra_photos(
id serial primary key,photo bytea
);


Alter table review add venue_id int;
Alter table review add foreign key(venue_id) references venue(id);


Alter table notification add user_email varchar(50);
Alter table notification add foreign key(user_email) references user_info(email);

Alter table forget add user_email varchar(50);
Alter table forget add foreign key(user_email) references user_info(email);

Alter table phone_verification add user_email varchar(50);
Alter table phone_verification add foreign key(user_email) references user_info(email);

Alter table email_verification add user_email varchar(50);
Alter table email_verification add foreign key(user_email) references user_info(email);

Alter table user_profile add user_email varchar(50);
Alter table user_profile add foreign key(user_email) references user_info(email);

Alter table user_profile add phone_id int;
Alter table user_profile add foreign key(phone_id) references phone(id);

Alter table venue add address_id int;
Alter table venue add foreign key(address_id) references address(id);

Alter table venue add user_profile_id int;
Alter table venue add foreign key(user_profile_id) references user_info(id);

Alter table venue add phone_id int;
Alter table venue add foreign key(phone_id) references phone(id);

Alter table availability add venue_id int;
Alter table availability add foreign key(venue_id) references venue(id);


Alter table availability add price_package_id int;
Alter table availability add foreign key(price_package_id) references price_package(id);
queries added by utsav
