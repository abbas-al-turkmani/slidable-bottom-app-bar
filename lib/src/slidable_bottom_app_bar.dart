import 'package:flutter/material.dart';

import 'shape_painters/noteched_rounded_painter.dart';
import 'shape_painters/noteched_wave_painter.dart';
import 'shape_painters/rounded_curved_painter.dart';
import 'slidable_bottom_app_bar_shape.dart';

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

  final Widget pageBody;
  final Widget? body;
  final Widget? child;
  final Widget? buttonChild;

  final Color? color;
  final Color? buttonColor;
  final Color shadowColor;

  final bool allowShadow;
  final bool hasCenterButton;

  final double maxHeight;

  final Duration animationDuration;
  final Curve animationCurve;

  final SlidableBottomAppBarShape shape;

  final void Function()? onButtonPressed;

  @override
  State<SlidableBottomAppBar> createState() => _NotechedResponsiveAppBarState();
}

class _NotechedResponsiveAppBarState extends State<SlidableBottomAppBar> {
  bool _isShown = true;

  late Map<SlidableBottomAppBarShape, CustomPainter> _shapes;

  @override
  void initState() {
    _shapes = {
      SlidableBottomAppBarShape.rounded: NotechedRoundedPainter(
        widget.color!,
        widget.allowShadow,
        widget.shadowColor,
        widget.hasCenterButton,
      ),
      SlidableBottomAppBarShape.wave: NotechedWavePainter(
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
    };

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    final ThemeData theme = Theme.of(context);

    final double buttomAppBarHeight = screenSize.height * 0.1;

    double containerHeight = _isShown ? widget.maxHeight : buttomAppBarHeight;

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
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      buttomAppBarHeight,
                      0,
                      0,
                    ),
                    child: Container(
                      width: screenSize.width,
                      height: widget.maxHeight,
                      color: widget.color ?? theme.bottomAppBarColor,
                      child: widget.body,
                    ),
                  ),
                  CustomPaint(
                    size: Size(screenSize.width, buttomAppBarHeight),
                    painter: shape,
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
                            backgroundColor:
                                widget.buttonColor ?? theme.bottomAppBarColor,
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
