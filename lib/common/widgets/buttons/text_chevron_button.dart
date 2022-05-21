import 'package:flutter/material.dart';
import 'package:yoko_testwork/const/text_styles.dart';

import 'chevron_icon.dart';

class TextChevronButton extends StatelessWidget {
  const TextChevronButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.isBlue = false,
  }) : super(key: key);

  final String text;
  final bool isBlue;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: onTap as Function()?,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: isBlue ? kBlueTextTS : kBlackTextTS,
            ),
            const ChevronIcon(
              size: 12,
              isRight: true,
            ),
          ],
        ),
      ),
    );
  }
}
