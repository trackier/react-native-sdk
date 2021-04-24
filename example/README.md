# react-native-hello-world
A starter guide for setting up and deploying react-native on an Android device.

Environment Setup and Build
https://facebook.github.io/react-native/docs/getting-started.html#content

## Getting Started

1. Ensure you've followed the [React Native - Get Started Guide](https://facebook.github.io/react-native/docs/getting-started.html) for the platform/s of choice
1. Clone this project `git clone https://github.com/mcnamee/react-native-starter-app.git`
1. Run `npm install` from root directory
1. [Prepare Device or Emulator for a deploy](https://developer.android.com/training/basics/firstapp/running-app.html) 
1. Run `react-native -start` from root directory
1. Run `react-native run-android` in a new terminal from root directory. 


## Handy Commands

| Command | Output |
| --- | --- |
| ipconfig/all | Show's the machine ip details, look for ipv4 for your ip. Useful when configuring debug server on testing device |
| adb start server | Starts the adb server to listen for devices|
| adb kill server | Kills the adb server|
| android avd | Opens the Android Virtual Device app |
| adb devices | Shows currently connected Andorid devices |
| android sdk | Opens the Android SDK manager, useful when updating build tools |
| gradlew clean | Cleans and rebuild your Android platform project |
| gradlew compileDebug --stacktrace | Add stacktrace logging to gradle config |
| react-native -start  | Starts the react-native dev server |
| react-native run-android | Builds and deployes the app to listening Android device or emulator |



## Troubleshooting

| Error | Fix |
| --- | --- |
| error “Could not get BatchedBridge, make sure your bundle is packaged properly” | On device select Dismiss, shake device (opens Developer menu) -> Dev Settings -> Choose Debug server host & port for device (computers IP address and the port: 192.168.0.xx:8xxx, port is usually :8081) |











