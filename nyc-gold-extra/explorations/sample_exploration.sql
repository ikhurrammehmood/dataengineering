-- Databricks notebook source
-- !!! Before performing any data analysis, make sure to run the pipeline to materialize the sample datasets. The tables referenced in this notebook depend on that step.

USE CATALOG `workspace`;
USE SCHEMA `nyc-gold`;

SELECT * from `sample_trips_nyc_gold_extra`;

-- COMMAND ----------

SELECT year(week) Year_ridden , zip , sum(fare_amount) total_fare_amount , sum(trip_distance)tota_distance_covered FROM `workspace`.`nyc-taxi-demo`.`flagged_rides`
GROUP by year(week),zip
ORDER BY 1,2
