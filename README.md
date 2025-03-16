<p align="center">
  <img src="https://github.com/maiow/expose-android-version/actions/workflows/test.yml/badge.svg"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
  <img src="https://badge.fury.io/gh/maiow%2Fexpose-android-version.svg"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
  <img src="https://img.shields.io/github/last-commit/maiow/expose-android-version">
</p>
This action exposes the version name and version code from your Android app's `build.gradle.kts` file as env vars.

Currently works for Android projects with a `build.gradle.kts` file located in the `app/` directory, which is where this file is typically found when you pull an Android repository during your CI flow.

There are only two inputs:

1. `EXPOSE_CODE`: This is optional, default is **'true'**. If you don't want the **version code** exposed, set it to **'false'** .

2. `EXPOSE_NAME`: This is also optional, default is **'true'**. if you don't want the **version name** exposed, set it to **'false'** .

### Example:
~~~~~~~
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repo
      uses: actions/checkout@v2
      - name: Expose version name
      uses: maiow/expose-android-version@v1.0.1
      with:
        EXPOSE_CODE: 'false'
~~~~~~~
Depending on your set values, and if the `build.gradle.kts` file is found in the `app/`, the action will expose the **version code** as an env var named `ANDROID_VERSION_CODE` and the **version name** as an env var named `ANDROID_VERSION_NAME`, both as string.

See [Android CI sample](https://github.com/maiow/AndroidCISample) for another example of usage.

