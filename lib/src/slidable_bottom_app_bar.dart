import 'package:flutter/material.dart';
import 'dart:ui';

import 'shape_painters/notched_rounded_painter.dart';
import 'shape_painters/notched_rounded_flat_painter.dart';
import 'shape_painters/notched_wave_painter.dart';
import 'shape_painters/rounded_curved_painter.dart';
import 'slidable_bottom_app_bar_shape.dart';

///bottom app bar can silde to the position of the screen that spicefied in maxHeight property
///
class SlidableBottomAppBar extends StatefulWidget {
  const SlidableBottomAppBar({
    Key? key,
    required this.pageBody,
    this.body,
    this.child,
    this.shape = SlidableBottomAppBarShape.rounded,
    this.backgroundBlurValue = 0,
    this.minHeight = 120,
    this.maxHeight = 250,
    this.hasCenterButton = true,
    this.onButtonPressed,
    this.onButtonPressedToggle = true,
    this.buttonChild,
    this.buttonHeight = 0.25,
    this.buttonElevation = 0.1,
    this.allowShadow = false,
    this.color = Colors.blue,
    this.buttonColor = Colors.blue,
    this.shadowColor = Colors.black,
    this.animationDuration = const Duration(seconds: 1),
    this.animationCurve = Curves.easeIn,
  }) : super(key: key);

  ///important pageBody property is used to Declare the page contents.
  final Widget pageBody;

  ///body property is used to Declare the body of the app bar the will appear after clicking the button or silding if the haseCenterButton property is set to false.
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

  final bool allowShadow;
  final bool hasCenterButton;

  ///blurs the background under the bar.
  final double backgroundBlurValue;

  ///the minimum height that app bar will slide to it.
  final double minHeight;

  ///the maximum height that app bar will slide to it.
  final double maxHeight;

  ///the slide show animation duration.
  final Duration animationDuration;

  /// the slide show animation curve.
  final Curve animationCurve;

  ///the shape of the app bar.
  final SlidableBottomAppBarShape shape;

  ///height of the button [values between 0 and 1]
  final double buttonHeight;

  ///elevation of the button [values between 0 and 1]
  final double buttonElevation;

  ///onButtonPressed event this Function will run after pressing the button and starting the slide show.
  final void Function()? onButtonPressed;

  ///will the bar expand and shrink on clicking the button.
  final bool onButtonPressedToggle;

  @override
  State<SlidableBottomAppBar> createState() => _NotechedResponsiveAppBarState();
}

class _NotechedResponsiveAppBarState extends State<SlidableBottomAppBar> {
  bool _isShown = false;

  late Map<SlidableBottomAppBarShape, CustomPainter> _shapes;

  @override
  void initState() {
    _shapes = {
      SlidableBottomAppBarShape.rounded: NotchedRoundedPainter(
        widget.color!,
        widget.allowShadow,
        widget.shadowColor,
        widget.hasCenterButton,
      ),
      SlidableBottomAppBarShape.wave: NotchedWavePainter(
        widget.color!,
        widget.allowShadow,
        widget.shadowColor,
        widget.hasCenterButton,
      ),
      SlidableBottomAppBarShape.roundedCurved: RoundedCurvedPainter(
        widget.color!,
        widget.allowShadow,
        widget.shadowColor,
        widget.hasCenterButton,
      ),
      SlidableBottomAppBarShape.roundedFlat: RoundedFlatPainter(
        widget.color!,
        widget.allowShadow,
        widget.shadowColor,
        widget.hasCenterButton,
      ),
    };

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    double containerHeight = _isShown ? widget.maxHeight : widget.minHeight;

    var shape = _shapes[widget.shape];

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
                if (!_isShown) {
                  if (details.delta.direction < 0) _isShown = true;
                } else {
                  if (details.delta.direction > 0) _isShown = false;
                }

                setState(() {});
              },
              child: Stack(
                children: [
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaX: widget.backgroundBlurValue,
                          sigmaY: widget.backgroundBlurValue),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              widget.minHeight,
                              0,
                              0,
                            ),
                            child: Container(
                              width: screenSize.width,
                              height: widget.maxHeight,
                              color: widget.color,
                              child: widget.body,
                            ),
                          ),
                          CustomPaint(
                            size: Size(screenSize.width, widget.minHeight),
                            painter: shape,
                          ),
                          SizedBox(
                            width: screenSize.width,
                            height: widget.minHeight,
                            child: widget.child,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    heightFactor: widget.buttonHeight,
                    child: widget.hasCenterButton
                        ? FloatingActionButton(
                            onPressed: () {
                              if (widget.onButtonPressedToggle) {
                                setState(() {
                                  _isShown = !_isShown;
                                });
                              }
                              widget.onButtonPressed!();
                            },
                            backgroundColor: widget.buttonColor,
                            elevation: widget.buttonElevation,
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
