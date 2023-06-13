# Visiokit

This is a Flutter project for Visioky by Madison Technologies. Visiokit is an application to assist in diagnosis and medical liaison, easing the process of diagnosis with the help of connected devices or conventional medical equipment.

## Documents
See the [Visioklit Documentation (Phase 1)](https://docs.google.com/document/d/1QImGL59e4IesWYaj9YFCn9OEEhqpDXszhvF1oSW84wQ/edit)

## Environment

[✓] Flutter (Channel stable, 3.7.1, on macOS 13.1 22C65 darwin-x64, locale en-VN)

[✓] Xcode - develop for iOS and macOS (Xcode 14.2)

[✓] Android Studio (version 2022.1)

[✓] Java (version 19.0.2)

## Package
| Package                                                                                     | Pub                                                                                           |
| ------------------------------------------------------------------------------------------  | --------------------------------------------------------------------------------------------  |
| [bloc](https://pub.dev/packages/bloc)                                         | ^8.1.0                              
| [flutter_bloc](https://pub.dev/packages/flutter_bloc)                         | ^8.1.1     
| [equatable](https://pub.dev/packages/equatable)                               | ^2.0.5
| [dartz](https://pub.dev/packages/dartz)                                       | ^0.10.1  
| [permission_handler](https://pub.dev/packages/flutter-permission-handler)     | ^10.2.0  
| [pdf](https://pub.dev/packages/pdf)                                           | ^3.9.0  
| [health](https://pub.dev/packages/health)                                     | ^4.5.0  
| ...    

## Getting Started

**Step 1:**

Download or clone this repo by using the link below:

```
https://bitbucket.org/madison_tech/medibox-flutter/src/phase_1/
```

**Step 2:**

*Workpace settings*

[✓] Setup flutter flavor: Download config file [here](https://drive.google.com/file/d/12vNAbBHnHdOnmv8CO3Hl4xIM6zLy9KV7/view?usp=sharing)

[✓] *Disable flutter desktop support*

```
flutter config --no-enable-macos-desktop
flutter config --no-enable-windows-desktop
flutter config --no-enable-linux-desktop
```

[✓] *Vertical rulers in VSCode*

File → Preferences → Settings. Paste this setting:

```
"editor.rulers": [
        80,
        120
]
```
**Step 3:** Run project

*Connect your device*

[DEV] Debug mode

```
flutter run --flavor dev
```

[DEV] Release mode

```
flutter run --flavor dev --release
```

Note*: If you want to run on production environment just change dev to prod.

### Project Structure

```
src/
|- common/
    |- routers
    |- app_routers.dart
    |- widget
        |- input_box.dart/
        |- ...
    |- ...

|- constants/
    |- app_constants.dart
    |- app_colors.dart
    |- app_messsage.dart
    |- ...
 
|- data/
    |- repositories/
        |- local.dart
            |- user_repository.dart
            |- ...
        |- remote
            |- health_repository.dart
    |- models/
        |- user.dart
        |- ...
    |- network.dart
    
|- extensions
    |- string_extension.dart
    |- ...

|- managers
    |- health_manager.dart
    |- ...
    
|- services
    |- health_service
        |- health_service.dart
    |- json_loader
    |- managers
    |- notification_service
    |- permission_services
|- utils
    |- health_service_types.dart
    |- dropdown_data_helper.dart
    |- ...
    
|- presentation
    |- pages/
        |- login/
            |- bloc/
                |- bloc.dart
                |- login_bloc.dart
                |- login_event.dart
                |- login_state.dart
            |- page/
                |- login_body.dart
                |- login_page.dart
                |- page.dart
            |- widgets/
                |- login_input_view.dart
                |- login_top_section.dart
                |- widget.dart
                |- ...
            |- login.dart
        |- tabbar/
        |- home/
        |- ...
    |- presentation.dart
|- main.dart

```
