#!/bin/bash

if [ "$EXPOSE_CODE" == 'true' ]; then
    ANDROID_VERSION_CODE=$(grep "versionCode" app/build.gradle.kts | sed "s/.*versionCode\\s*=\\s*\\([0-9]*\\).*/\\1/")
    echo "ANDROID_VERSION_CODE=$ANDROID_VERSION_CODE" >> extracted_values.txt
fi

if [ "$EXPOSE_NAME" == 'true' ]; then
    ANDROID_VERSION_NAME=$(grep "versionName" app/build.gradle.kts | sed "s/.*versionName\\s*=\\s*'\\(.*\\)'.*/\\1/" | tr -d '[:space:]' | sed 's/"//g' | sed 's/versionName=//')
    echo "ANDROID_VERSION_NAME=$ANDROID_VERSION_NAME" >> extracted_values.txt
fi
