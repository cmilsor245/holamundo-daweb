#!/bin/bash

chmod +x /opt/codedeploy-agent/deployment-root/$DEPLOYMENT_GROUP_ID/$DEPLOYMENT_ID/deployment-archive/gradlew

cd /opt/codedeploy-agent/deployment-root/$DEPLOYMENT_GROUP_ID/$DEPLOYMENT_ID/deployment-archive
./gradlew build
./gradlew war

mv build/libs/holamundo-0.0.1-SNAPSHOT.war /build/libs/holamundo2.war