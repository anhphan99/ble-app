# Medibox

This is a Flutter project for Medibox. Medibox is an application to assist in diagnosis and medical liaison. Medibox wants to create an application to ease the process of diagnosis with the help of connected devices or conventional medical equipments.

## Documents
See [DOCUMENTS](https://docs.google.com/document/d/1ObDaxUCgfl3nQ-53hm0buw9-iBbW_EHBCiAxoc707tg)

## Environment

[✓] Flutter (Channel stable, 3.7.1, on macOS 13.1 22C65 darwin-x64, locale en-VN)

[✓] Xcode - develop for iOS and macOS (Xcode 14.2)

[✓] Android Studio (version 2022.1)

## Package
| Package                                                                                     | Pub                                                                                                                  |
| ------------------------------------------------------------------------------------------  | -------------------------------------------------------------------------------------------------------------------- |
| [bloc](https://github.com/felangel/bloc/tree/master/packages/bloc)                          | ^8.1.0                              |
| [flutter_bloc](https://github.com/felangel/bloc/tree/master/packages/flutter_bloc)          |  ^8.1.1     
| [equatable](https://github.com/felangel/equatable)                                          | ^2.0.5
| [dartz](https://github.com/spebbe/dartz)                                                    | ^0.10.1  
| [permission_handler](https://github.com/baseflow/flutter-permission-handler)                | ^10.2.0  
| [pdf](https://github.com/DavBfr/dart_pdf)                                                   | ^3.9.0  
| [health](https://github.com/cph-cachet/flutter-plugins/tree/master/packages/health)         | ^4.5.0  
---

## Getting Started

**Step 1:**

Download or clone this repo by using the link below:

```
https://bitbucket.org/madison_tech/medibox-flutter/src/phase_0.5/
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

Select a device to use

```
flutter run
```
### Project Structure

```
src/
|- common/
    |- app_data_formatter.dart
    |- input_box.dar/
    |- ...

|- constants/
    |- app_constants.dart
    |- app_colors.dart
    |- app_messsage.dart
    |- ...
 
|- data/
    |- error/
        |- exception.dart
    |- models/
        |- health_data.dart
        |- ...
    |- network.dart
    
|- extensions
    |- string_extension.dart
    |- ...

|- managers
    |- export_pdf_manager.dart
    |- health_manager.dart
    |- ...
|- presentation
    |- page/
        |- health/
            |- bloc/
                |- bloc.dart
                |- health_bloc.dart
                |- health_event.dart
                |- health_state.dart
            |- page/
                |- health_body.dart
                |- health_page.dart
                |- page.dart
            |- widgets/
                |- health_data_card.dart
                |- permission_required.dart
                |- widget.dart
                |- ...
            |- health.dart
        |- tabbar/
    |- presentation.dart
|- main.dart

```

### License
This project is licensed under the [insert license here].
