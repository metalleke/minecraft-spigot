#!/bin/bash

if [ ! -f $SPIGOT_HOME/spigot.jar ]; then
  mkdir -p $SPIGOT_HOME/build
  cd $SPIGOT_HOME/build
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  HOME=$SPIGOT_HOME/build java -jar BuildTools.jar --rev $REV
  cp $SPIGOT_HOME/build/Spigot/Spigot-Server/target/spigot-*.jar $SPIGOT_HOME/spigot.jar
fi

if [ ! -f $SPIGOT_HOME/data ]; then
  mkdir -p $SPIGOT_HOME/data
fi

if [ ! -f $SPIGOT_HOME/data/eula.txt ]; then
  echo "eula=TRUE" > $SPIGOT_HOME/data/eula.txt
fi

cd $SPIGOT_HOME/data

java $JVM_OPTS -jar $SPIGOT_HOME/spigot.jar nogui --noconsole