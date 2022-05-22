import 'package:flutter/cupertino.dart';
import 'package:yoko_testwork/const/colors.dart';

class ErrorMessage extends StatelessWidget {
  final String errorMessage;
  final Color color;

  const ErrorMessage({
    Key? key,
    required this.errorMessage,
    this.color = kPrimaryRedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            CupertinoIcons.exclamationmark_circle_fill,
            color: color,
            size: 20,
          ),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              errorMessage,
              style: TextStyle(color: color),
            ),
          ),
        ],
      ),
    );
  }
}
