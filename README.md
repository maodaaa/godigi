# Godigi

A Flutter application built with modern architecture patterns including BLoC state management, auto_route navigation, and freezed data classes.

## Prerequisites

- **Flutter Version**: 3.35.0 or higher
- **Dart SDK**: 3.9.0 or higher
- **Android Studio** or **VS Code** with Flutter extensions
- **Xcode** (for iOS development on macOS)

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/maodaaa/godigi.git
cd godigi
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Generate Code (Required)

This project uses code generation for freezed data classes, auto_route, and JSON serialization. Run the following command before building:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 4. Run the Application

```bash
flutter run
```

## Default Login Credentials

For testing and development purposes, use these default credentials:

- **Email**: test@godigi.com
- **Password**: 123456
- **OTP Email**: 4321
- **OTP SMS**: 1234

## Project Structure

```
lib/
├── app/
│   └── routing/           # Auto-generated routes
├── core/
│   └── constants/         # App constants
├── features/
│   ├── article_detail/    # Article detail feature
│   ├── before_login/      # Pre-login screens
│   ├── home/             # Home feature
│   ├── login/            # Authentication
│   ├── main/             # Main navigation
│   └── profile/          # User profile
└── main.dart
```

## Key Dependencies

- **State Management**: `flutter_bloc` ^9.1.1
- **Navigation**: `auto_route` ^10.1.2
- **Code Generation**: `freezed` ^3.2.3
- **Local Storage**: `shared_preferences` ^2.5.3
- **SVG Support**: `flutter_svg` ^2.2.1
- **UI Components**: `flutter_staggered_grid_view`, `skeletonizer`, `pinput`

## Development Commands

### Code Generation
```bash
# Watch for changes and rebuild automatically
dart run build_runner watch

# One-time build with conflict resolution
dart run build_runner build --delete-conflicting-outputs
```