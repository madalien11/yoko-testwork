import 'package:flutter/material.dart';

class CustomGradient extends StatelessWidget {
  const CustomGradient({
    Key? key,
    required this.begin,
    required this.end,
    required this.colors,
    this.verticalMargin = 0,
    this.horizontalMargin = 0,
    this.height = 226,
    this.borderRadius = 16,
  }) : super(key: key);

  final FractionalOffset begin;
  final FractionalOffset end;
  final List<Color> colors;
  final double verticalMargin;
  final double horizontalMargin;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: colors,
          // stops: const [0.0, 1.0],
        ),
      ),
      margin: EdgeInsets.symmetric(
        vertical: verticalMargin,
        horizontal: horizontalMargin,
      ),
    );
  }
}
