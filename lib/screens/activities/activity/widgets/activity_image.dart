import 'package:flutter/material.dart';
import 'package:yoko_testwork/common/widgets/buttons/chevron_icon.dart';
import 'package:yoko_testwork/common/widgets/style/custom_gradient.dart';
import 'package:yoko_testwork/const/colors.dart';
import 'package:yoko_testwork/const/text_styles.dart';

class ActivityImage extends StatelessWidget {
  const ActivityImage({
    Key? key,
    required this.title,
    required this.img,
    required this.height,
    required this.bgImageHeightRatio,
  }) : super(key: key);

  final String title;
  final String img;
  final double height;
  final double bgImageHeightRatio;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height * bgImageHeightRatio,
          decoration: BoxDecoration(
            color: kPrimaryBlueColor,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(img),
            ),
          ),
        ),
        CustomGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          borderRadius: 0,
          height: height * bgImageHeightRatio,
          colors: [
            kPrimaryBlueColor.withOpacity(0.5),
            kSecondaryBlueColor.withOpacity(0.5),
          ],
        ),
        CustomGradient(
          begin: const FractionalOffset(0.5, -0.5),
          end: FractionalOffset.center,
          borderRadius: 0,
          height: height * bgImageHeightRatio,
          colors: [
            Colors.black,
            Colors.black.withOpacity(0),
          ],
        ),
        CustomGradient(
          begin: FractionalOffset.center,
          end: const FractionalOffset(0.5, 1.5),
          borderRadius: 0,
          height: height * bgImageHeightRatio,
          colors: [
            Colors.black.withOpacity(0),
            Colors.black,
          ],
        ),
        Container(
          height: height * bgImageHeightRatio - 15,
          color: Colors.transparent,
          child: Center(
            child: Text(
              title,
              style: kHeader1TS,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ChevronIcon(
                size: 50,
                color: kWhite100,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                width: 100,
                child: Image.asset(
                  "assets/img/logo.png",
                  fit: BoxFit.scaleDown,
                ),
              ),
              const SizedBox(
                height: 50,
                width: 50,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
