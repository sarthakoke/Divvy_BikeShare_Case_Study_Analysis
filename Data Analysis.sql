SELECT COUNT(*) AS total_rides
FROM CyclistProject..trips_cleaned

--Number of Casual or Member
SELECT member_casual,COUNT(*) AS total_rides
FROM CyclistProject..trips_cleaned
GROUP BY member_casual

-- Number of Rides wrt Type of bike ridden by members or by casual customers
SELECT member_casual, rideable_type, 
COUNT(*) AS total_rides
FROM CyclistProject..trips_cleaned
GROUP BY rideable_type, member_casual
ORDER BY member_casual, total_rides DESC

-- AVG RIDE LENGTH PER DAY and wrt Casual or member status
SELECT member_casual, day_of_week, 
AVG(ride_length_in_mins) AS avg_ride_length, 
AVG(AVG(ride_length_in_mins)) OVER(PARTITION BY member_casual) AS combined_avg_ride_length
FROM CyclistProject..trips_cleaned
GROUP BY member_casual, day_of_week
ORDER BY member_casual;

-- AVG RIDE LENGTH Weekly
SELECT member_casual, day_of_week, AVG(ride_length_in_mins) AS avg_ride_length
FROM CyclistProject..trips_cleaned
GROUP BY member_casual, day_of_week
ORDER BY member_casual, day_of_week;

-- AVG RIDE LENGTH wrt Casual or member status
SELECT member_casual, AVG(ride_length_in_mins) AS combined_avg_ride_length
FROM CyclistProject..trips_cleaned
GROUP BY member_casual
ORDER BY member_casual

-- MONTHLY AVG RIDE LENGTH
SELECT member_casual, MONTH, AVG(ride_length_in_mins) AS avg_ride_length
FROM CyclistProject..trips_cleaned
GROUP BY member_casual, MONTH
ORDER BY member_casual, MONTH

-- Monthly Rider Count
SELECT member_casual, MONTH, 
COUNT(*) AS total_rides_per_month
FROM CyclistProject..trips_cleaned
GROUP BY member_casual, MONTH
ORDER BY member_casual, MONTH

-- Weekly Rider Count
SELECT member_casual, day_of_week,COUNT(*) AS total_rides_per_week
FROM CyclistProject..trips_cleaned
GROUP BY member_casual,day_of_week
ORDER BY member_casual

--Hourly Rider Count
SELECT member_casual, DATEPART(HOUR, started_at) AS hour_of_day, COUNT(*) AS total_trips
FROM CyclistProject..trips_cleaned
GROUP BY member_casual, DATEPART(HOUR, started_at)
ORDER BY member_casual, hour_of_day;

--Usual Ride_Starting Point & No. of Rides for Casual Users
SELECT member_casual, start_station_name,
AVG(start_lat) AS start_lat, 
AVG(start_lng) AS start_lng,
COUNT(*) AS total_rides
FROM CyclistProject..trips_cleaned
--WHERE member_casual = 'casual'
GROUP BY member_casual, start_station_name
ORDER BY 5 desc

--Usual Ride_Ending Point & No. of Rides for Members
SELECT member_casual, end_station_name,
AVG(end_lat) AS end_lat, 
AVG(end_lng) AS end_lng,
COUNT(*) AS total_rides
FROM CyclistProject..trips_cleaned
--WHERE member_casual = 'casual'
GROUP BY member_casual, end_station_name
ORDER BY 5 desc
--Usual Ride_Starting Point & No. of Rides for Members
SELECT member_casual, start_station_name,
AVG(start_lat) AS start_lat, 
AVG(start_lng) AS start_lng,
COUNT(*) AS total_rides
FROM CyclistProject..trips_cleaned
WHERE member_casual = 'member'
GROUP BY member_casual, start_station_name
ORDER BY 5 desc

--Usual Ride_Ending Point & No. of Rides for Members
SELECT member_casual, end_station_name,
AVG(end_lat) AS end_lat, 
AVG(end_lng) AS end_lng,
COUNT(*) AS total_rides
FROM CyclistProject..trips_cleaned
WHERE member_casual = 'member'
GROUP BY member_casual, end_station_name
ORDER BY 5 desc

SELECT member_casual, end_station_name,start_station_name,
AVG(end_lat) AS end_lat, 
AVG(end_lng) AS end_lng,
COUNT(*) AS total_rides, AVG(start_lat) AS start_lat, 
AVG(start_lng) AS start_lng
FROM CyclistProject..trips_cleaned
--WHERE member_casual = 'casual'
GROUP BY member_casual, start_station_name, end_station_name
ORDER BY 6 desc

CASUAL #c7f296
MEMBERSHIP #94e7a8