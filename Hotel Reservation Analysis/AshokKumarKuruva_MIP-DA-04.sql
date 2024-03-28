create database mentorness;
use mentorness;

show tables;
select * from hotel_reservation;

-- 1. What is the total number of reservations in the dataset?
select count(*) as total_reservations from hotel_reservation;

-- 2. Which meal plan is the most popular among guests?
select type_of_meal_plan,count(type_of_meal_plan) as count_meals from hotel_reservation 
group by type_of_meal_plan;

-- 3. What is the average price per room for reservations involving children?
select avg(avg_price_per_room) avg_price_for_childrens from hotel_reservation 
where no_of_children>0;

-- 4. How many reservations were made for the year 20XX (replace XX with the desired year)?
SELECT COUNT(*) AS total_reservations FROM hotel_reservation
WHERE YEAR(arrival_date) = '2018';

-- 5. What is the most commonly booked room type?
select room_type_reserved,count(room_type_reserved) as booking_rooms from hotel_reservation 
group by room_type_reserved order by booking_rooms desc;

-- 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
select count(*) as weekend_night_reservations from hotel_reservation
where no_of_weekend_nights>0;

-- 7. What is the highest and lowest lead time for reservations?
select max(lead_time) as Highest_lead_time_for_reservation,
       min(lead_time) as lowest_lead_time_for_reservation from hotel_reservation;
       
-- 8. What is the most common market segment type for reservations?
select market_segment_type,count(market_segment_type) as reservations_cnt from hotel_reservation 
group by market_segment_type order by reservations_cnt desc limit 1;
       
-- 9. How many reservations have a booking status of "Confirmed"?
select count(*) as booking_confirmed from hotel_reservation where booking_status != 'canceled';

-- 10. What is the total number of adults and children across all reservations?
select sum(no_of_adults) as adults, sum(no_of_children) as childrens from hotel_reservation;
 
 -- 11. What is the average number of weekend nights for reservations involving children?
 select avg(no_of_weekend_nights) avg_weekend_nights_for_childrens from hotel_reservation 
 where no_of_children>0;
 
 -- 12. How many reservations were made in each month of the year?
 select monthname(arrival_date) as month, count(*) as total_reservations
 from hotel_reservation group by monthname(arrival_date);
 
 -- 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
 select room_type_reserved, avg(no_of_weekend_nights) as total_weekend_nights, avg(no_of_week_nights) as total_weekday_nights 
 from hotel_reservation group by room_type_reserved;
 
 -- 14. For reservations involving children, what is the most common room type, and what is the average price for that room type?
 select room_type_reserved, avg(avg_price_per_room) as avg_price from hotel_reservation where no_of_children > 0
 group by room_type_reserved order by avg_price desc;
 
 -- 15. Find the market segment type that generates the highest average price per room?
 select market_segment_type, avg(avg_price_per_room) as avg_price from hotel_reservation
 group by market_segment_type order by avg_price desc;
 