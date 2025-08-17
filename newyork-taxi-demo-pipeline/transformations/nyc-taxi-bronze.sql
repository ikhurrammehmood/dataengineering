-- Bronze layer: Raw data ingestion

CREATE OR REFRESH STREAMING TABLE taxi_raw_records 
(CONSTRAINT valid_distance EXPECT (trip_distance > 0.0) ON VIOLATION DROP ROW)
AS SELECT *
FROM STREAM(samples.nyctaxi.trips);