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

## Things to note

the `slidable_bottom_app_bar` is a widget for mobile platform, if you use it in desctop or web it will locs ugly.

## Preview

```dart
    ...
        SlidableBottomAppBar(
            hasCenterButton: true,
    ...
```

![with button preview](https://user-images.githubusercontent.com/77194041/201508217-b6dd5b9d-0838-4b07-ab94-6aa14a506aed.gif)

```dart
    ...
        SlidableBottomAppBar(
            hasCenterButton: false,
    ...
```

![without button preview](https://user-images.githubusercontent.com/77194041/201508220-efd5c720-43c1-46cd-b149-386a97b20d26.gif)

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

## Usage

the way to use it is by put it after Scaffold widget and put the page contents in the pageBody property, as shown in the example below:

```dart
return Scaffold(
      body: SlidableBottomAppBar(
        shape: SlidableBottomAppBarShape.rounded,
        color: Colors.blue,
        buttonColor: Colors.blue,
        maxHeight: screenSize.height * 0.5,
        allowShadow: true,
        body: Column(
          children: const [
            Center(
              child: Text('content'),
            ),
          ],
        ),
        buttonChild: const Icon(
          Icons.refresh,
          color: Colors.white,
        ),
        onButtonPressed: () {
          //do some thing
        },
        pageBody: const SafeArea(
          child: Center(
            child: Text('page contents'),
          ),
        ),
      ),
    );
```

the example above gives you the folowing result:
![example](https://user-images.githubusercontent.com/77194041/201508935-333aa7db-d9bf-43b2-a1d8-0a372564d8c8.gif)

## shapes

the parameter `shape` takes three values:

```dart
shape: SlidableBottomAppBarShape.rounded,
```

this value will give you the folowing result:
![shape:rounded](https://user-images.githubusercontent.com/77194041/201509750-569b1f77-4f04-4571-9b5a-9e5df14b1ccd.jpg)

```dart
shape: SlidableBottomAppBarShape.wave,
```

this value will give you the folowing result:
![shape:rounded](https://user-images.githubusercontent.com/77194041/201509284-3ed47912-08bb-4c75-ba99-dde2f9637675.jpg)

```dart
shape: SlidableBottomAppBarShape.roundedCurved,
```

this value will give you the folowing result:
![shape:roundedCurved](https://user-images.githubusercontent.com/77194041/201509973-0afef566-7def-44fa-9a74-06ab296a39bc.jpg)

## Author

Abbas al turkmani - [githup](https://github.com/abbas-al-turkmani) - [mail me](abbas.az408@gmail.com)
