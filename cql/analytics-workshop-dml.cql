copy analytics_workshop.avg_review.csv (
  instrument_symbol,
  last_updated,
  avg_review_stars
)
  from '/tmp/datastax-spark-sql-workshop/data/analytics_workshop.avg_review.csv'
  with HEADER = TRUE;

copy analytics_workshop.countries 
  from '/tmp/datastax-spark-sql-workshop/data/analytics_workshop.countries.csv' 
  with HEADER = TRUE;

copy analytics_workshop.customers (
  account_number,
  first_name,
  last_name,
  gender,
  country,
  city,
  street_address,
  phone,
  email,
  supports_fair_trade_min,
  humane_work_conditions_min,
  humane_to_women_min,
  humane_to_children_min,
  humane_to_animals_min,
  avoids_blood_diamonds_min,
  avoids_weapons_min,
  avoids_tobacco_min,
  avoids_gambling_min,
  avoids_alcohol_min,
  protects_environment_min
)
  from '/tmp/datastax-spark-sql-workshop/data/analytics_workshop.customers.csv' 
  with HEADER = true;
  
copy analytics_workshop.review (
  customer_id,
  instrument_symbol,
  review_date,
  review_stars
)
  from '/tmp/datastax-spark-sql-workshop/data/analytics_workshop.review.csv'
  with HEADER = TRUE;
  
copy analytics_workshop.transactions (
  transaction_id,
  instrument_id,
  instrument_name,
  instrument_industry,
  industry_sector,
  buy_or_sell,
  units,
  transaction_date,
  transaction_time,
  account_number,
  account_first_name,
  account_last_name,
  account_gender,
  account_country,
  account_city
)
  from '/tmp/datastax-spark-sql-workshop/data/analytics_workshop.transactions.csv' 
  with HEADER = true;
  
copy analytics_workshop.transactions_historical (
  transaction_id,
  instrument_id,
  instrument_name,
  instrument_industry,
  industry_sector,
  buy_or_sell,
  units,
  transaction_date,
  transaction_time,
  account_number,
  account_first_name,
  account_last_name,
  account_gender,
  account_country,
  account_city
)
  from '/tmp/datastax-spark-sql-workshop/data/analytics_workshop.transactions_historical.csv' 
  with HEADER = true;
  
copy analytics_workshop.transactions_buy (
  transaction_id,
  instrument_id,
  instrument_name,
  instrument_industry,
  industry_sector,
  buy_or_sell,
  units,
  transaction_date,
  transaction_time,
  account_number,
  account_first_name,
  account_last_name,
  account_gender,
  account_country,
  account_city
)
  from '/tmp/datastax-spark-sql-workshop/data/analytics_workshop.transactions_buy.csv' 
  with HEADER = true;
  
copy analytics_workshop.transactions_sell (
  transaction_id,
  instrument_id,
  instrument_name,
  instrument_industry,
  industry_sector,
  buy_or_sell,
  units,
  transaction_date,
  transaction_time,
  account_number,
  account_first_name,
  account_last_name,
  account_gender,
  account_country,
  account_city
)
  from '/tmp/datastax-spark-sql-workshop/data/analytics_workshop.transactions_sell.csv' 
  with HEADER = true;
