---Exercise 2 step 2

create table bookings(
                         booking_id int auto_increment primary key,
                         customer_id int not null,
                         constraint fk_customer
                             foreign key (customer_id) references customers(customer_id),
                         flight_id int not null,
                         constraint fk_flight
                             foreign key (flight_id) references flights(flight_id)
);

create table flights(
                        flight_id int auto_increment primary key,
                        flight_number varchar(50) not null,
                        aircraft_id int not null,
                        constraint fk_aircraft
                            foreign key (aircraft_id) references aircrafts(aircraft_id),
                        flight_mileage int not null
);


create table aircrafts(
                          aircraft_id int auto_increment primary key,
                          aircraft_name varchar(50) not null,
                          total_aircraft_seats int not null
);


create table customers(
                          customer_id int auto_increment primary key,
                          customer_name varchar(100) not null,
                          customer_status varchar(30) not null,
                          total_customer_mileage int not null
);



-----Exercise 2 step 3


insert into aircrafts (aircraft_name, total_aircraft_seats)
values
('Boeing 747', 400),
('Airbus A330', 236),
('Boeing 777', 264);


insert into customers (customer_name, customer_status, total_customer_mileage)
values
    ('Agustine Riviera', 'Silver', 115235),
    ('Alaina Sepulvida', 'None', 6008),
    ('Tom Jones', 'Gold', 205767),
    ('Sam Rio', 'None', 2653),
    ('Jessica James', 'Silver', 127656),
    ('Ana Janco', 'Silver', 136773),
    ('Jennifer Cortez', 'Gold', 300582),
    ('Christian Janco', 'Silver', 14642);



insert into flights (flight_number, aircraft_id, flight_mileage)
values
    ('DL143', 1, 135),
    ('DL122', 2, 4370),
    ('DL53', 3, 2078),
    ('DL222', 3, 1765),
    ('DL37', 1, 531);



insert into bookings (customer_id, flight_id)
values
    (1, 1), -- Agustine DL143
    (1, 2), -- Agustine DL122
    (2, 2), -- Alaina DL122
    (3, 2), -- Tom DL122
    (3, 3), -- Tom DL53
    (3, 4), -- Tom DL222
    (4, 1), -- Sam DL143
    (4, 5), -- Sam DL37
    (5, 1), -- Jessica DL143
    (5, 2), -- Jessica DL122
    (6, 4), -- Ana DL222
    (7, 4), -- Jennifer DL222
    (8, 4); -- Christian DL222

----exercise 3


-- 1.	Total number of flights:
-- 2.	Average flight distance:
-- 3.	Average number of seats per aircraft:
-- 4.	Average miles flown by customers, grouped by status:
-- 5.	 Max miles flown by customers, grouped by status:
-- 6.	Number of aircrafts with "Boeing" in their name:
-- 7.	Flights with distance between 300 and 2000 miles:
-- 8.	Average flight distance booked, grouped by customer status:
-- 9.	Most booked aircraft among Gold status members:


select count(*) as total_number_of_flights
from flights

select avg(flight_mileage) as average_flight_distance
from flights

select avg(total_aircraft_seats) as average_total_seats
from aircrafts

select customer_status, avg(total_customer_mileage) as average_total_mileage
from customers
group by customer_status


select customer_status, max(total_customer_mileage) as average_total_mileage
from customers
group by customer_status

select  count(*) as name_with_Boeing
from aircrafts
where aircraft_name like '%Boeing%';


select * from flights
where flight_mileage between 300 and 2000

SELECT
    c.customer_status,
    AVG(f.flight_mileage) AS avg_flight_distance_booked
FROM bookings b
         JOIN customers c ON b.customer_id = c.customer_id
         JOIN flights f ON b.flight_id = f.flight_id
GROUP BY c.customer_status;



SELECT
    a.aircraft_name,
    count(*) as total_booking
FROM bookings b
         JOIN customers c ON b.customer_id = c.customer_id
         JOIN flights f ON b.flight_id = f.flight_id
         join aircrafts a on f.aircraft_id=a.aircraft_id
where customer_status='Gold'
group by a.aircraft_name
ORDER BY total_booking  DESC


