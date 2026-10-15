# Flutter Users App (Machine Test)

## Features
- Login screen (UI only, form validation, no real auth)
- Home screen fetching users from https://jsonplaceholder.typicode.com/users
- Users shown in a `ListView`
- Loading indicator while fetching
- Error handling (no internet, timeout, bad status code, bad JSON) with a Retry button
- Pull-to-refresh
- Tap a user to open a details page

## Run
```
flutter create .        # generates android/ios/web folders (keeps lib/ and pubspec.yaml)
flutter pub get
flutter run
```

Android note: internet permission is already included in the default debug manifest;
for release builds make sure `<uses-permission android:name="android.permission.INTERNET"/>`
is in `android/app/src/main/AndroidManifest.xml`.

## Structure
```
lib/
  main.dart
  models/user.dart
  services/api_service.dart
  screens/login_screen.dart
  screens/home_screen.dart
  screens/user_details_screen.dart
```
