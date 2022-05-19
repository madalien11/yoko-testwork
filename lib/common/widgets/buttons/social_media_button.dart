import 'package:flutter/material.dart';
import 'package:yoko_testwork/const/colors.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final Function onTap;

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
        child: Icon(icon, color: kWhite100),
      ),
    );
  }
}
