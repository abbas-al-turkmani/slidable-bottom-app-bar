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

A flutter package create a bottom app bar that can slide to the position of the screen that spicefied in maxHeight property when clicking on the button or by sliding by hande.

## Usage

the way to use it is by put it after Scaffold widget and put the page contents in the pageBody property, as shown in the example below:

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

![Preview]('https://raw.githubusercontent.com/abbas-al-turkmani/slidable-bottom-app-bar/main/gifs/1.gif')

```dart
    ...
        SlidableBottomAppBar(
            hasCenterButton: false,
    ...
```

![Preview]('https://raw.githubusercontent.com/abbas-al-turkmani/slidable-bottom-app-bar/main/gifs/2.gif')

## Getting started

In the pubspec.yaml of your flutter project, add the following dependency:

```yaml
dependencies:
  slidable_bottom_app_bar: ^1.0.1
```

Then run $ flutter pub get. In your library, add the following import:

```dart
import 'package:slidable_bottom_app_bar/slidable_bottom_app_bar.dart';
```

## About Author

Abbas al turkmani
[githup](https://github.com/abbas-al-turkmani)
[mail me](abbas.az408@gmail.com)
