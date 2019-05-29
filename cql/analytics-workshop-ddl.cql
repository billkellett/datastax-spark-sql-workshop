// start from a clean slate

drop keyspace if exists analytics_workshop;

// create the keyspace for the workshop

create keyspace if not exists analytics_workshop 
    WITH replication = {'class': 'NetworkTopologyStrategy', 'replication_factor' : 3};

// create all tables

create table if not exists analytics_workshop.countries (
    country text,
    primary key (country));
    
create table if not exists analytics_workshop.customers (
    account_number              int,
    first_name                  text,
    last_name                   text,
    gender                      text,
    country                     text,
    city                        text,
    street_address              text,
    phone                       text,
    email                       text,
    supports_fair_trade_min     int,
    humane_work_conditions_min  int,
    humane_to_women_min         int,
    humane_to_children_min      int,
    humane_to_animals_min       int,
    avoids_blood_diamonds_min   int,
    avoids_weapons_min          int,
    avoids_tobacco_min          int,
    avoids_gambling_min         int,
    avoids_alcohol_min          int,
    protects_environment_min    int,
primary key (account_number));

create table if not exists analytics_workshop.transactions (
    transaction_id              text,
    instrument_id               text,
    instrument_name             text,
    instrument_industry         text,
    industry_sector             text,
    buy_or_sell                 text,
    units                       int,
    transaction_date            text,
    transaction_time            text,
    account_number              int,
    account_first_name          text,
    account_last_name           text,
    account_gender              text,
    account_country             text,
    account_city                text,
primary key (account_number, transaction_id))
with clustering order by (transaction_id desc);

create table if not exists analytics_workshop.transactions_historical (
    transaction_id              text,
    instrument_id               text,
    instrument_name             text,
    instrument_industry         text,
    industry_sector             text,
    buy_or_sell                 text,
    units                       int,
    transaction_date            text,
    transaction_time            text,
    account_number              int,
    account_first_name          text,
    account_last_name           text,
    account_gender              text,
    account_country             text,
    account_city                text,
primary key (account_number, transaction_id))
with clustering order by (transaction_id desc);

create table if not exists analytics_workshop.transactions_buy (
    transaction_id              text,
    instrument_id               text,
    instrument_name             text,
    instrument_industry         text,
    industry_sector             text,
    buy_or_sell                 text,
    units                       int,
    transaction_date            text,
    transaction_time            text,
    account_number              int,
    account_first_name          text,
    account_last_name           text,
    account_gender              text,
    account_country             text,
    account_city                text,
primary key (account_number, transaction_id))
with clustering order by (transaction_id desc);

create table if not exists analytics_workshop.transactions_sell (
    transaction_id              text,
    instrument_id               text,
    instrument_name             text,
    instrument_industry         text,
    industry_sector             text,
    buy_or_sell                 text,
    units                       int,
    transaction_date            text,
    transaction_time            text,
    account_number              int,
    account_first_name          text,
    account_last_name           text,
    account_gender              text,
    account_country             text,
    account_city                text,
primary key (account_number, transaction_id))
with clustering order by (transaction_id desc);
