-- This file defines a sample transformation.
-- Edit the sample below or add new transformations
-- using "+ Add" in the file browser.

CREATE MATERIALIZED VIEW `nyc_taxi_yearly_summary` AS
SELECT
  year(week) AS Year_ridden,
  zip,
  SUM(fare_amount) AS total_fare_amount,
  SUM(trip_distance) AS total_distance_covered
FROM
  `workspace`.`nyc-taxi-demo`.`flagged_rides`
GROUP BY
  year(week),
  zip
ORDER BY
  Year_ridden,
  zip