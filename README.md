# cosmo_test_app

Simple CRUD app using CosmoCloud service.

## Getting Started

This project demonstrates the use of Cosmocloud API to build a simple app for CRUD operations.

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Running the demo
In order to run the demo app just download and install `app-release.apk` from the `main` branch.

## Testing and setting up local environment
- First you need to install Flutter and dart. Follow the aforementioned article to do so.
- Next set up the [CosmoCloud APIs and MongoDB](https://docs.cosmocloud.io/getting-started).
- For DB model on CosmoCloud use following json template
```
{
	"name": "STRING",
	"empId": "STRING",
	"addLine1": "STRING",
	"city": "STRING",
	"country": "STRING",
	"zipCode": "STRING",
	"contactMethod": "STRING",
	"contactValue": "STRING"
}
```
- Set up the models and APIs.
- In the `delete request model` add `{"id": "STRING"}` as request body.
- Now create a new folder `secs` in `lib`. Under `secs` create new file naming `secrets.dart` and put following in it:
```
const String projectid = "Your Project ID";
const String environmentId = "Your environment ID";
const String baseApiUrl = "Your base endpoint URL e.g.: https://tier-region-.cosmocloud.io/development/api/modelName";
const Map<String, String> defaultHeader = {
  "projectId": "Your Project ID",
  "environmentId": "Your environment ID"
};
```
- Now run `flutter pub get` in the cmd in project folder.
- Now create a new emulator on Android Studio or whatever VM you are using.
- Run `flutter devices` in cmd to check whether device is visible or not.
- Now run `flutter run -d "device name or id"` in cmd. You can also choose device from `Status Bar` and press `F5` on keyboard if you are using VS Code.
- This will run app in `debug mode`. To create release apk run `flutter build apk`. For different platforms command may vary.
```
Available subcommands:
  aar         Build a repository containing an AAR and a POM file.
  apk         Build an Android APK file from your app.
  appbundle   Build an Android App Bundle file from your app.
  bundle      Build the Flutter assets directory from your app.
  web         Build a web application bundle.
  windows     Build a Windows desktop application.
``` 
