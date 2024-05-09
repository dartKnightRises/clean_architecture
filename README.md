# clean_architecture

A new Flutter project for understanding clean architecture.

## Explanation


# Android:

*In order to remove white screen at the beginning of starting the app, we need to modify code for Android and iOS separately.*
1. Inside android->app->src->main->res->value, created color.xml file and added our app's primary color.
2. android->app->src->main->res->drawable and ->drawable-v21, go to launch_background in both folder and change drawable as "<item android:drawable="@color/primary" />"


*To change app name:*
1. Create strings resource file (strings.xml) same as color.xml in values folder and create app_name.
2. Update label in Android Manifest to change app name as "android:label="@string/app_name""

*To change app icon:*
1. Inside android->app->src->main->res->mipmap-(all dimensions), replace ic_launcher with your app icon with same name and same dimension.



## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
