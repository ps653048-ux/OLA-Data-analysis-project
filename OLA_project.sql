SELECT * FROM ola.bookings;
--  1. Retrieve all successful bookings:

create view successful_bookings as 
select * from bookings 
where Booking_Status="Success";

select * from successful_bookings;
--  2. Find the average ride distance for each vehicle type:

create view ride_distance_for_each_vehicle as
select Vehicle_Type,round(avg(Ride_Distance),2) as average_distance from bookings
group by Vehicle_Type;

select * from ride_distance_for_each_vehicle;
--  3. Get the total number of cancelled rides by customers:

create view canceled_rides_by_customers as
select count(*) from bookings 
where Booking_Status="canceled by customer";

--  4. List the top 5 customers who booked the highest number of rides:

create view  top_5_customers as
select customer_id, count(booking_Id) as total_rides
from bookings
group by Customer_ID
order by total_rides desc
limit 5;

select * from top_5_customers;
--  5. Get the number of rides cancelled by drivers due to personal and car-related issues:

create view cancelled_by_driver_Personal_and_car_issues as
select count(*) from bookings
where Canceled_Rides_by_Driver= "Personal & car related issue";


--  6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

create view max_min_driver_rating_for_prime_sedan as
select  Vehicle_Type, max(Driver_Ratings),min(Driver_Ratings)   from bookings
where Vehicle_Type="Prime Sedan";

--  7. Retrieve all rides where payment was made using UPI:

create view payment_upi as
select * from bookings
where Payment_Method="UPI";

--  8. Find the average customer rating per vehicle type:

create view avg_cust_rating_per_vehicle_type as
select vehicle_type, round(avg(Customer_Rating),3) as avg_cust_rating from bookings
group by Vehicle_Type
order by avg_cust_rating desc;

--  9. Calculate the total booking value of rides completed successfully:

create view total_bookings as
select  sum(booking_value) as total_bookings from bookings
where Booking_Status="success";


--  10. List all incomplete rides along with the reason: 

create view incomplete_rides_with_reasons as
select Booking_ID ,  Incomplete_Rides_Reason from bookings
where Incomplete_Rides="yes"
