-- Databricks notebook source
-- Create streaming table
CREATE OR REPLACE STREAMING TABLE st_orders
AS
SELECT * FROM STREAM(samples.tpch.orders)

-- COMMAND ----------

-- Create MV
CREATE OR REPLACE MATERIALIZED VIEW agg_orders
AS
SELECT 
count(o_orderkey) AS cnt_orders,
o_orderstatus
FROM LIVE.st_orders
GROUP BY o_orderstatus
