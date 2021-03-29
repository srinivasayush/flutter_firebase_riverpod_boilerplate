# flutter_firebase_riverpod_boilerplate

A Flutter boilerplate app incorporating riverpod state management and firebase functionality

## Getting Started

1. Add your google_services.json file in the android/app directory
2. Delete the .gitignore file in the android/app directory
3. Go to the android/app/build.gradle file and change the `applicationId` field to your unique [Android Application Id](https://developer.android.com/studio/build/application-id)
4. Re-create the flutter app within the root directory
```powershell
flutter create .
```
5. Go to the [Firebase Console](https://console.firebase.google.com/) and enable Google Authentication, and Cloud Firestore
6. Go to the [Firebase Console](https://console.firebase.google.com/) and add a new Android App
    - When creating the app in console, it will ask you for an optional SHA-1 certificate.
    - This app uses Google Sign In, so it requires an SHA-1 certifiate
    - Generate an SHA-1 certificate for Google Sign In with
    ```powershell
    cd android
    gradlew signingReport
    ```
    - Scroll to the bottom of the output and copy paste the SHA-1 certificate under the `debugAndroidTest` variant
7. Get all dependencies for the app with
```powershell
flutter pub get
```
8. Run the flutter app with flutter run
```powershell
flutter run
```

## Implemented Features

Authentication
- Google Sign In
- Email and Password 

Cloud Firestore
- Adding users to users collection
- Getting and displaying logged in user data from users collection
- Getting and displaying list of users

Riverpod
- State management with Riverpod library
- Able to access state from anywhere in Flutter application


## Future Features
Authentication
- Other authentication methods such as Twitter, Github, etc.

Cloud Storage
- Upload multimedia files


This project is a starting point for a Flutter application with Riverpod and Firebase.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)
- [FlutterFire Documentation](https://firebase.flutter.dev/docs/overview/)
- [Riverpod Documentation](https://riverpod.dev/docs/getting_started/)

For help getting started with Flutter, view its
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
