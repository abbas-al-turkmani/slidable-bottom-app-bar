import 'package:flutter/material.dart';

import 'shape_painters/noteched_rounded_painter.dart';
import 'shape_painters/noteched_wave_painter.dart';
import 'shape_painters/rounded_curved_painter.dart';
import 'slidable_bottom_app_bar_shape.dart';

///bottom app bar can silde to the position of the screen which spicefied in maxHeight property
class SlidableBottomAppBar extends StatefulWidget {
  const SlidableBottomAppBar({
    Key? key,
    required this.pageBody,
    this.body,
    this.child,
    this.shape = SlidableBottomAppBarShape.rounded,
    this.maxHeight = 250,
    this.hasCenterButton = true,
    this.onButtonPressed,
    this.buttonChild,
    this.allowShadow = false,
    this.color = Colors.blue,
    this.buttonColor = Colors.blue,
    this.shadowColor = Colors.black,
    this.animationDuration = const Duration(seconds: 1),
    this.animationCurve = Curves.easeIn,
  }) : super(key: key);

  ///important pageBody property is used to Declare the page contents.
  final Widget pageBody;

  ///body property is used to Declare the body of the app bar which will appear after clicking the button or silding if the haseCenterButton property is set to false.
  final Widget? body;

  ///child property is used to declare the appearance content of the app bar.
  final Widget? child;

  ///the appearance child of the center button
  final Widget? buttonChild;

  ///the color of the bottom app bar including the background color of the body property.
  final Color? color;

  ///the color of the button if the haseCenterButton property is set to false the button will not appear.
  final Color? buttonColor;

  ///the color of the shadow that appeare ander the app bar over the app bar content body.
  final Color shadowColor;

  ///if [true] it will add a shadow around the app bar, and if [false] no shadow will be added.
  final bool allowShadow;

  ///detrimined if there is a button in the center of the appbar or not.
  ///[true] it will show a button in the center.
  ///[false] no button in the center.
  final bool hasCenterButton;

  ///the maximum height that app bar will slide to it.
  final double maxHeight;

  ///the slide show animation duration.
  final Duration animationDuration;

  /// the slide show animation curve.
  final Curve animationCurve;

  ///the shape of the app bar.
  final SlidableBottomAppBarShape shape;

  ///onButtonPressed event this Function will run after pressing the button and starting the slide show.
  final void Function()? onButtonPressed;

  @override
  State<SlidableBottomAppBar> createState() => _NotechedResponsiveAppBarState();
}

class _NotechedResponsiveAppBarState extends State<SlidableBottomAppBar> {
  bool _isShown = false;

  late CustomPainter _shape;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    final double buttomAppBarHeight = screenSize.height * 0.1;

    double containerHeight = _isShown ? widget.maxHeight : buttomAppBarHeight;

    switch (widget.shape) {
      case SlidableBottomAppBarShape.rounded:
        _shape = NotechedRoundedPainter(
          widget.color!,
          widget.allowShadow,
          widget.shadowColor,
          widget.hasCenterButton,
        );
        break;
      case SlidableBottomAppBarShape.wave:
        _shape = NotechedWavePainter(
          widget.color!,
          widget.allowShadow,
          widget.shadowColor,
          widget.hasCenterButton,
        );
        break;
      case SlidableBottomAppBarShape.roundedCurved:
        _shape = RoundedCurvedPainter(
          widget.color!,
          widget.allowShadow,
          widget.shadowColor,
          widget.hasCenterButton,
        );
        break;
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        widget.pageBody,
        AnimatedPositioned(
          duration: widget.animationDuration,
          curve: widget.animationCurve,
          bottom: 0,
          left: 0,
          height: containerHeight,
          child: Container(
            width: screenSize.width,
            height: widget.maxHeight,
            color: Colors.transparent,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  if (!_isShown) {
                    if (details.delta.direction < 0) _isShown = true;
                  } else {
                    if (details.delta.direction > 0) _isShown = false;
                  }
                });
              },
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: buttomAppBarHeight),
                    child: Container(
                      width: screenSize.width,
                      height: widget.maxHeight,
                      color: widget.color,
                      child: widget.body,
                    ),
                  ),
                  CustomPaint(
                    size: Size(screenSize.width, buttomAppBarHeight),
                    painter: _shape,
                  ),
                  SizedBox(
                    width: screenSize.width,
                    height: buttomAppBarHeight,
                    child: widget.child,
                  ),
                  Center(
                    heightFactor: 0.6,
                    child: widget.hasCenterButton
                        ? FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                _isShown = !_isShown;
                              });

                              widget.onButtonPressed!();
                            },
                            backgroundColor: widget.buttonColor,
                            elevation: 0.1,
                            child: widget.buttonChild,
                          )
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
