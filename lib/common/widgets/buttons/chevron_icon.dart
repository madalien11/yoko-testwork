import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoko_testwork/const/colors.dart';

class ChevronIcon extends StatelessWidget {
  const ChevronIcon({
    Key? key,
    this.size = 50,
    this.onTap,
    this.color = kPrimaryBlueColor,
    this.isRight = false,
  }) : super(key: key);

  final double size;
  final Function? onTap;
  final Color color;
  final bool isRight;

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: AlwaysStoppedAnimation(isRight ? 180 / 360 : 0),
      child: SizedBox(
        height: size,
        width: size,
        child: IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: onTap as Function()?,
          icon: SvgPicture.asset(
            "assets/svg/chevron_left.svg",
            fit: BoxFit.scaleDown,
            semanticsLabel: 'Chevron Left',
            color: color,
          ),
        ),
      ),
    );
  }
}
