import 'package:flutter/material.dart';
import 'package:yoko_testwork/const/colors.dart';
import 'package:yoko_testwork/const/text_styles.dart';

class BlueTextButton extends StatelessWidget {
  const BlueTextButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          title,
          style: kTextButtonTitleTS,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          kPrimaryBlueColor,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(
              color: kPrimaryGrayColor,
            ),
          ),
        ),
      ),
      onPressed: onPressed as Function()?,
    );
  }
}
