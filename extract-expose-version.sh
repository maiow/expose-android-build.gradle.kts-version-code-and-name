#!/bin/bash

# Check if the build.gradle.kts file exists
if [ ! -f "app/build.gradle.kts" ]; then
    echo "Error: app/build.gradle.kts file not found."
    exit 1
fi

echo "EXPOSE_CODE is $EXPOSE_CODE, EXPOSE_NAME is $EXPOSE_NAME"

# Check if EXPOSE_CODE is true for extracting Android version code
if [ "$EXPOSE_CODE" = 'true' ]; then
    # Extract Android version code as string
    ANDROID_VERSION_CODE=$(grep "versionCode" app/build.gradle.kts | sed 's/.*versionCode\s*=\s*\([0-9]*\).*/\1/' | awk '{print $0+0}')
    if [ -z "$ANDROID_VERSION_CODE" ]; then
        echo "Error: Unable to extract version code."
        exit 1
    fi

    # Write the extracted Android version code to a temporary file
    echo "ANDROID_VERSION_CODE=$ANDROID_VERSION_CODE" > extracted_values.txt
fi

# Check if EXPOSE_NAME is true for extracting version name
if [ "$EXPOSE_NAME" = 'true' ]; then
    # Extract Android version name
    ANDROID_VERSION_NAME=$(grep "versionName" app/build.gradle.kts | sed "s/.*versionName\\s*=\\s*'\\(.*\\)'.*/\\1/" | tr -d '[:space:]' | sed 's/"//g' | sed 's/versionName=//')
    if [ -z "$ANDROID_VERSION_NAME" ]; then
        echo "Error: Unable to extract version name."
        exit 1
    fi

    # Append the extracted Android version name to the temporary file
    echo "ANDROID_VERSION_NAME=$ANDROID_VERSION_NAME" >> extracted_values.txt
fi
