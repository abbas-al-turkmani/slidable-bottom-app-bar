<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

A flutter package create a bottom app bar that can slide to the medal of the screen when clicking on the button or by sliding by hande.

## Usage

```dart
return Scaffold(
        SlidableBottomAppBar(
            shape: SlidableBottomAppBarShape.wave,
            color: Colors.Blue,
            buttonColor: Colors.Blue,
            maxHeight: screenSize.height * 0.5,
            allowShadow: true,
            body: Column(
                ...
            ),
            buttonChild: Icon(
                    Icons.refresh,
                    color: Colors.white,
                )
            onButtonPressed: () {
                ...
            },
            pageBody: SafeArea(
                Text('page contents'),
            ),
        ),
    );
```

## Preview

```dart
    ...
        SlidableBottomAppBar(
            hasCenterButton: true,
    ...
```

![Preview]('https://github.com/abbas-al-turkmani/slidable-bottom-app-bar/blob/main/gifs/1.gif')

```dart
    ...
        SlidableBottomAppBar(
            hasCenterButton: false,
    ...
```

![Preview]('https://github.com/abbas-al-turkmani/slidable-bottom-app-bar/blob/main/gifs/2.gif')

## Getting started

In the pubspec.yaml of your flutter project, add the following dependency:

```yaml
dependencies:
  slidable_bottom_app_bar: ^0.0.3
```

Then run $ flutter pub get. In your library, add the following import:

```dart
import 'package:slidable_bottom_app_bar/slidable_bottom_app_bar.dart';
```

## Additional information
