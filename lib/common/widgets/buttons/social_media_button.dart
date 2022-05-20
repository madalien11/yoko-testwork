import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoko_testwork/common/enums/enums.dart';
import 'package:yoko_testwork/const/colors.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    Key? key,
    required this.onTap,
    required this.socialMedia,
  }) : super(key: key);

  final Function onTap;
  final SocialMediaEnum socialMedia;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as Function()?,
      child: Container(
        margin: const EdgeInsets.all(8),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: kWhite100),
        ),
        child: SvgPicture.asset(
          "assets/svg/${socialMediaIcon(socialMedia)}.svg",
          fit: BoxFit.scaleDown,
          semanticsLabel: 'Chevron Left',
          color: kWhite100,
        ),
      ),
    );
  }
}
