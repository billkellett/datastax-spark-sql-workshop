#!/bin/bash

# BK VERSION

# Download Zeppelin from Google Drive
# Zeppelin distribution (DSE-specific) by doanduyhai http://www.doanduyhai.com/blog/?p=2325

# If we are on node0 install Zeppelin, copy Notebooks and start it up.
if [ `hostname` == 'node0' ]
then
  echo "Downloading Zeppelin..."
  curl -s -o zeppelin-0.7.1.tar.gz 'https://s3.amazonaws.com/dse-sketch-examples/zeppelin-0.7.1-dse-5.1.1.tar.gz' -L 2>&1 | tee zeppelin-download.log
  echo "... Zeppelin download complete.

  echo "Untar Zeppelin."
  tar -zxf zeppelin-0.7.1.tar.gz

  #Zeppelin Notebook API.
  echo "Start Zeppelin."
  zeppelin-0.7.1/bin/zeppelin-daemon.sh start

  #Although start is synchronous, I'll give it some time anyway
  sleep 5

  #XML Parser
  echo "Install jquery..."
  sudo apt-get install jq
  echo "... jquery installation complete."

  #Initialize Zeppelin.
  
  # save for debugging purposes
  echo "Downloading to zeppelinhome.out..."
  curl -o zeppelinhome.out "http://node0:8080/#/" -L -m 10
  echo "... download to zeppelinhome.out complete."
  echo "Downloading to zeppelininterp.out..."
  curl -o zeppelininterp.out "http://node0:8080/#/interpreter" -L -m 10
  echo "... download to zeppelininterp.out complete."

  #Set variable to the Zeppelin Cassandra interpreter id
  CASSANDRA_INTERP_ID=$(curl node0:8080/api/interpreter/setting | jq '.body|.[]|select(.name=="cassandra")|.id' -r)

  #Cassandra interpreter settings
  #Modify node0 - create a Zeppelin cassandra-settings.json file that modifies the cluster name and host name.
  echo "Modifying Cassandra interpreter settings..."
  curl node0:8080/api/interpreter/setting | jq '.body|.[]|select(.name=="cassandra")|setpath(["properties","cassandra.cluster"]; "Cluster 1")|setpath(["properties","cassandra.hosts"]; "node0")|del(.id)' > cassandra-settings.json
  echo "... modification of Cassandra interpreter settings complete."

  #Update Interpreter Settings - upload the newly-created cassandra-settings.json file to the Zeppelin interpreter settings, using the CASSANDRA_INTERP_ID saved earlier
  echo "Uploading Cassandra interpreter settings..."
  curl -vX PUT "http://node0:8080/api/interpreter/setting/$CASSANDRA_INTERP_ID" -d @cassandra-settings.json \--header "Content-Type: application/json"
  echo "... upload of Cassandra interpreter settings complete."

  #Set variable to the Zeppelin Spark interpreter id
  SPARK_INTERP_ID=$(curl node0:8080/api/interpreter/setting | jq '.body|.[]|select(.name=="spark")|.id' -r)

  #Spark interpreter settings
  #Add cassandra host setting - create a Zeppelin spark-settings.json file that customizes for this installation
  echo "Modifying Spark interpreter settings..."
  curl node0:8080/api/interpreter/setting | jq '.body|.[]|select(.name=="spark")|setpath(["properties","spark.cassandra.connection.host"]; "node0")|del(.id)' > spark-settings.json
  echo "... modification of Spark interpreter settings complete."

  #Update Interpreter Settings
  echo "Uploading Spark interpreter settings..."
  curl -vX PUT "http://node0:8080/api/interpreter/setting/$SPARK_INTERP_ID" -d @spark-settings.json \--header "Content-Type: application/json"
  echo "... upload of Spark interpreter settings complete."

  sleep 5

  # import zeppelin notebooks
  echo "Importing Zeppelin notebooks..."
  curl -vX POST http://node0:8080/api/notebook/import -d @notebooks/bkplay.json \--header "Content-Type: application/json"
  curl -vX POST http://node0:8080/api/notebook/import -d @notebooks/raneynote.json \--header "Content-Type: application/json"
  curl -vX POST http://node0:8080/api/notebook/import -d @notebooks/raneynote2.json \--header "Content-Type: application/json"
  echo "... Zeppelin notebooks import complete."

  sleep 5

  zeppelin-0.7.1/bin/zeppelin-daemon.sh restart

  echo "Finished Zeppelin Install"
fi
