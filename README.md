# Flutter Movies App (Riverpod + Clean Architecture)

## Screenshot
|List|Detail|
|---|---|
|![Simulator Screenshot - iPhone 16 - 2025-05-08 at 15 44 52](https://github.com/user-attachments/assets/43ad5d0d-da51-4e5e-8c10-29f84ed92af1)|![Simulator Screenshot - iPhone 16 - 2025-05-08 at 15 44 21](https://github.com/user-attachments/assets/fcb0c10e-186b-4d51-b99c-750d3709a4b1)|

## Environment
```
% flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.24.5, on macOS 15.1.1 24B91 darwin-arm64
    (Rosetta), locale ko-KR)
[✓] Android toolchain - develop for Android devices (Android SDK version 33.0.2)
[✓] Xcode - develop for iOS and macOS (Xcode 16.1)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2024.3)
[✓] VS Code (version 1.98.2)
[✓] Connected device (6 available)            
[✓] Network resources
```

## Package in use
```
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.8
  equatable: ^2.0.7
  json_annotation: ^4.9.0
  dio: ^5.8.0+1
  flutter_riverpod: ^2.6.1
  cached_network_image: ^3.4.1
  flutter_dotenv: ^5.2.1
  google_fonts: ^6.2.1
  carousel_slider: ^5.0.0
  riverpod_annotation: ^2.6.1

dev_dependencies:
  flutter_test:
    sdk: flutter

  flutter_lints: ^4.0.0
  build_runner: ^2.4.13
  json_serializable: ^6.9.0
  riverpod_generator: ^2.6.3
  custom_lint: ^0.7.0
  riverpod_lint: ^2.6.3
```

## Getting Started

This project uses the TMDB API.

Before running the app, you need to [sign up on the TMDB website](https://www.themoviedb.org/signup), then obtain an Access Token on the [settings API page](https://www.themoviedb.org/settings/api).

Once you have this, create an `.env` file **at the root of the project** and add your access token:

```dart
// .env
TMDB_API_KEY=<Your Access Token>
```

Then, run the code generator:

```
dart run build_runner build
```

and run:
```
flutter run
```

----
