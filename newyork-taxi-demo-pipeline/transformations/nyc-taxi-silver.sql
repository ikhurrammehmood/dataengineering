
-- Silver layer 1: Flagged rides
CREATE OR REFRESH STREAMING TABLE flagged_rides 
AS SELECT
  date_trunc("week", tpep_pickup_datetime) as week,
  pickup_zip as zip, 
  fare_amount, trip_distance
FROM
  STREAM(taxi_raw_records)
WHERE ((pickup_zip = dropoff_zip AND fare_amount > 50) OR
       (trip_distance < 5 AND fare_amount > 50));

-- Silver layer 2: Weekly statistics
CREATE OR REFRESH MATERIALIZED VIEW weekly_stats
AS SELECT
  date_trunc("week", tpep_pickup_datetime) as week,
  AVG(fare_amount) as avg_amount,
  AVG(trip_distance) as avg_distance
FROM
 taxi_raw_records
GROUP BY week
ORDER BY week ASC;