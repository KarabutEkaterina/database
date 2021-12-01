CREATE TABLE IF NOT EXISTS client(
  client_id BIGINT not NULL,
  name varchar,
  middle_name VARCHAR,
  last_name VARCHAR,
  phone_number VARCHAR,
  email VARCHAR,
  city VARCHAR,
  PRIMARY KEY (client_id)
  );

CREATE TABLE IF NOT EXISTS bill(
  bill_id BIGINT NOT NULL,
  client_id bigint,
  price FLOAT,
  primary key (bill_id),
  FOREIGN key (client_id) REFERENCES client(client_id)
  );
  
CREATE TABLE IF NOT EXISTS discount(
  discount_id BIGINT NOT NULL,
  client_id bigint,
  percent INT,
  primary key (discount_id),
  FOREIGN key (client_id) REFERENCES client(client_id)
  );
  
create table if not exists client_order(
  client_order_id bigint not NULL,
  client_id BIGINT,
  order_date date,
  primary key (client_order_id),
  FOREIGN KEy (client_id) REFERENCES client(client_id)
  );
 
CREATE table if not EXISTS excurtion(
  excurtion_id BIGINT NOT NULL,
  description varchar,
  preferential_price float,
  standart_price float,
  duration varchar,
  PRIMARY key (excurtion_id)
  );
  
create table if not exists excurtion_order(
  excurtion_order_id bigint not NULL,
  client_order_id bigint,
  excurtion_id bigint,
  standart_amount INT,
  preferential_amount INT,
  PRIMARY key (excurtion_order_id),
  FOREIGN key (client_order_id) REFERENCES client_order(client_order_id),
  FOREIGN key (excurtion_id) REFERENCES excurtion(excurtion_id)
   );
   
CREATE table if not exists day(
  day_id bigint NOT NULL,
  day Varchar,
  primary key (day_id)
  );
  
CREATE table if not exists timetable(
  timetable_id bigint not NULL,
  excurtion_id bigint,
  day_id bigint,
  PRIMARY key (timetable_id),
  FOREIGN key (excurtion_id) REFERENCES excurtion(excurtion_id),
  FOREIGN key (day_id) REFERENCES day(day_id)
  );
   
create table if not exists food_item(
  food_id bigint not NULL,
  name varchar,
  description varchar,
  price float,
  primary key (food_id)
  );
      
create table if not exists food_order(
  food_order_id bigint not NULL,
  food_id bigint,
  client_order_id bigint,
  amount int,
  pickup_date date,
  primary key (food_order_id),
  foreign key (food_id) REFERENCES food_item(food_id),
  FOREIGN key (client_order_id) REFERENCES client_order(client_order_id)
  );

create table if not exists furniture(
  furniture_id bigint not NULL,
  name varchar,
  price float,
  serial_number varchar,
  primary key (furniture_id)
  );

create table if not exists housing(
  housing_id bigint not NULL,
  number int,
  number_of_floors int,
  number_of_rooms int,
  address varchar,
  PRIMARY key (housing_id)
  );

create table if not exists category(
  category_id bigint NOT NULL,
  description varchar,
  type varchar,
  PRIMARY key (category_id)
  );

create table if not exists room(
  room_id bigint not NULL,
  category_id bigint,
  housing_id bigint,
  number int,
  price float,
  primary key (room_id),
  FOREIGN key (category_id) REFERENCES category(category_id),
  FOREIGN key (housing_id) REFERENCES housing(housing_id)
  );
  
create table if not exists busy_dates(
  busy_dates_id bigint not NULL,
  room_id bigint,
  start_date date,
  end_date Date,
  primary key (busy_dates_id),
  FOREIGN key (room_id) REFERENCES room(room_id)
  );
  
create table if not exists compatible_room(
  compatible_room_id bigint not NULL,
  first_room_id bigint,
  second_room_id bigint,
  PRIMARY key (compatible_room_id),
  FOREIGN key (first_room_id) REFERENCES room(room_id),
  FOREIGN key (second_room_id) REFERENCES room(room_id)
  );

create table if not exists booking(
  booking_id bigint not NULL,
  client_id bigint,
  date_of_booking date,
  start_date date,
  end_date date,
  PRIMARY key (booking_id),
  FOREIGN key (client_id) REFERENCES client(client_id)
  );

create table if not exists room_booking(
  room_booking_id bigint NOT NULL,
  booking_id bigint,
  room_id bigint,
  PRIMARY key (room_booking_id),
  FOREIGN key (booking_id) REFERENCES booking(booking_id),
  FOREIGN key (room_id) REFERENCES room(room_id)
  );
  
CREATE table if not exists car_parking(
  car_parking_id bigint NOT NULL,
  number int,
  price float,
  PRIMARY key (car_parking_id)
  );
  
create table if not exists car_parking_booking(
  parking_booking_id bigint not NULL,
  booking_id bigint,
  car_parking_id bigint,
  PRIMARY key (parking_booking_id),
  FOREIGN key (booking_id) REFERENCES booking(booking_id),
  FOREIGN key (car_parking_id) REFERENCES car_parking(car_parking_id)
  );

create table if not exists parking_busy_dates(
  parking_busy_dates_id bigint not NULL,
  car_parking_id bigint,
  start_date date,
  end_date date,
  primary key (parking_busy_dates_id),
  FOREIGN key (car_parking_id) REFERENCES car_parking(car_parking_id)
  );




  
  
  