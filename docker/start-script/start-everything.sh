#!/bin/sh

# Pull latest version of app
cd /webapp

# Build app
/usr/local/maven/bin/mvn -Dmaven.test.skip=true package

# Copy war to Tomcat
rm -rf $CATALINA_HOME/webapps/*
cp target/ninja-sample-1.0-SNAPSHOT.war $CATALINA_HOME/webapps/ROOT.war

# Start Tomcat
$CATALINA_HOME/bin/startup.sh
tail -F /usr/local/tomcat/logs/catalina.out &

# Start nginx
nginx

