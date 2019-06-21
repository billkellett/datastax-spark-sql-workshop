#!/bin/bash
#
# Load CSV files into DSEFS so Spark can see them
#
echo "Starting populate-dsefs"
if [ `hostname` == 'node0' ]
then

  #Race Condition DSE has not started
  echo "Has DSE Started?"
  if ! nc -z node0 9042; then

    counter=0
    iterations=36
    sleepInterval=5

    echo "Waiting for DSE to start..."
    while  ! nc -z node0 9042; do

       echo "Waiting for DSE... Iteration: $counter Sleep: $sleepInterval seconds..."

       sleep $sleepInterval

       counter=$((counter+1))

       if [[ $counter -gt $iterations ]]; then
         echo "DSE has not started yet. Setup tables may fail."
         break
       fi
    done
  fi

   dse fs "put file:/tmp/datastax-spark-sql-workshop/data/analytics_workshop.transactions_buy.csv analytics_workshop.transactions_buy.csv"
   dse fs "put file:/tmp/datastax-spark-sql-workshop/data/analytics_workshop.transactions_sell.csv analytics_workshop.transactions_sell.csv"

   sleep 10s
fi
echo "Finished populate-dsefs"