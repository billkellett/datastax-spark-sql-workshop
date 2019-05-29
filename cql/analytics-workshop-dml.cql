copy alwaysonsql_workshop.countries 
  from '/tmp/datastax-alwaysonsql-workshop/data/alwaysonsql_workshop.countries.csv' 
  with HEADER = TRUE;

copy alwaysonsql_workshop.customers (
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
  from '/tmp/datastax-alwaysonsql-workshop/data/alwaysonsql_workshop.customers.csv' 
  with HEADER = true;
  
copy alwaysonsql_workshop.transactions (
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
  from '/tmp/datastax-alwaysonsql-workshop/data/alwaysonsql_workshop.transactions.csv' 
  with HEADER = true;
  
copy alwaysonsql_workshop.transactions_historical (
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
  from '/tmp/datastax-alwaysonsql-workshop/data/alwaysonsql_workshop.transactions_historical.csv' 
  with HEADER = true;
  
copy alwaysonsql_workshop.transactions_buy (
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
  from '/tmp/datastax-alwaysonsql-workshop/data/alwaysonsql_workshop.transactions_buy.csv' 
  with HEADER = true;
  
copy alwaysonsql_workshop.transactions_sell (
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
  from '/tmp/datastax-alwaysonsql-workshop/data/alwaysonsql_workshop.transactions_sell.csv' 
  with HEADER = true;
