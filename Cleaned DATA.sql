CREATE TABLE CyclistProject..trips_cleaned
SELECT 
  ride_id, 
  rideable_type,
  started_at,
  ended_at,
  DATEDIFF(MINUTE, started_at, ended_at) AS ride_length_in_mins,
  DATENAME(MONTH, started_at) AS month,
  DATENAME(WEEKDAY, started_at) AS day_of_week,
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual
FROM CyclistProject..trips AS t1
WHERE 
  DATEDIFF(MINUTE, started_at, ended_at) > 1 AND 
  DATEDIFF(MINUTE, started_at, ended_at) < 1440 AND
  start_station_name IS NOT NULL AND
  start_station_id IS NOT NULL AND
  end_station_name IS NOT NULL AND
  end_station_id IS NOT NULL AND
  start_lat IS NOT NULL AND
  start_lng IS NOT NULL AND
  end_lat IS NOT NULL AND
  end_lng IS NOT NULL



DROP TABLE IF EXISTS CyclistProject..trips_cleaned
CREATE TABLE CyclistProject..trips_cleaned (
  ride_id NVARCHAR(255),
  rideable_type NVARCHAR(255),
  started_at DATETIME,
  ended_at DATETIME,
  ride_length_in_mins Float,
  month NVARCHAR(255),
  day_of_week NVARCHAR(255),
  start_station_name NVARCHAR(255),
  start_station_id NVARCHAR(255),
  end_station_name NVARCHAR(255),
  end_station_id NVARCHAR(255),
  start_lat FLOAT,
  start_lng FLOAT,
  end_lat FLOAT,
  end_lng FLOAT,
  member_casual NVARCHAR(255)
)








INSERT INTO CyclistProject..trips_cleaned
SELECT 
  ride_id, 
  rideable_type,
  started_at,
  ended_at,
  DATEDIFF(MINUTE, started_at, ended_at) AS ride_length_in_mins,
  DATENAME(MONTH, started_at) AS month,
  DATENAME(WEEKDAY, started_at) AS day_of_week,
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual
FROM CyclistProject..trips AS t1
WHERE 
  DATEDIFF(MINUTE, started_at, ended_at) > 1 AND 
  DATEDIFF(MINUTE, started_at, ended_at) < 1440 AND
  start_station_name IS NOT NULL AND
  start_station_id IS NOT NULL AND
  end_station_name IS NOT NULL AND
  end_station_id IS NOT NULL AND
  start_lat IS NOT NULL AND
  start_lng IS NOT NULL AND
  end_lat IS NOT NULL AND
  end_lng IS NOT NULL

  SELECT * from CyclistProject..trips_cleaned
  order by 3,4