this example presents a simple page with buttom appbar can expand whin clicking on it's button:

![example](https://user-images.githubusercontent.com/77194041/201512285-45b417fb-3cdb-4ea0-9013-5e846db28e5c.gif)

in order to apply this example in your code use the following code:

```dart
import 'package:flutter/material.dart';
import 'package:slidable_bottom_app_bar/slidable_bottom_app_bar.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidableBottomAppBar(
        //appearance parameters
        shape: SlidableBottomAppBarShape.rounded,
        color: Colors.blue,
        buttonColor: Colors.blue,
        maxHeight: screenSize.height * 0.5,
        allowShadow: true,
        //main screen body
        pageBody: const SafeArea(
          child: Center(
            child: Text('page contents'),
          ),
        ),
        //the body of the SlidableBottomAppBar
        body: Column(
          children: const [
            Center(
              child: Text('content'),
            ),
          ],
        ),
        //the center button child
        buttonChild: const Icon(
          Icons.refresh,
          color: Colors.white,
        ),
        //the center button onPressed event
        onButtonPressed: () {
          //do some thing
        },
        //the content of the bottom app bar
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.home,
              color: Colors.white,
            ),
            SizedBox(
              width: screenSize.width * 0.1,
            ),
            const Icon(
              Icons.local_activity,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
```