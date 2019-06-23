#!/bin/bash
#
# Download jar files into the executables directory (they are too big to store on github)
#
echo "Starting download-jar"
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

   curl -o executables/datastax-spark-sql-v2-jar-with-dependencies.jar "http://billkellett.net/dse/datastax-spark-sql-v2-jar-with-dependencies.jar" -L -m 600

   sleep 10s
fi
echo "Finished download-jar"