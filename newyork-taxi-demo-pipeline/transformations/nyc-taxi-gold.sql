-- Gold layer: Top N rides to investigate
CREATE OR REPLACE MATERIALIZED VIEW top_n
AS SELECT
  weekly_stats.week,
  ROUND(avg_amount,2) as avg_amount, 
  ROUND(avg_distance,3) as avg_distance,
  fare_amount, trip_distance, zip , (fare_amount * 0.9) as discounted_fare_amount
FROM flagged_rides
LEFT JOIN weekly_stats ON weekly_stats.week = flagged_rides.week
ORDER BY fare_amount DESC
LIMIT 3;