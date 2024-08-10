import 'package:flutter/material.dart';

class BgCircle extends StatelessWidget {
  const BgCircle(
      {required this.color,
      this.bottom,
      this.top,
      this.left,
      this.right,
      this.height,
      this.width,
      super.key});

  final double? height;
  final double? width;
  final Color color;
  final double? top;
  final double? bottom;
  final double? right;
  final double? left;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      bottom: bottom,
      right: right,
      child: Container(
        height: height ?? MediaQuery.of(context).size.height / 5,
        width: width ?? MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          color: color.withOpacity(0.001),
          borderRadius: BorderRadius.circular(200),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.5),
              spreadRadius: 60,
              blurRadius: 500,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
      ),
    );
  }
}
