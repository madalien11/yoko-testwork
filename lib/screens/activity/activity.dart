import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoko_testwork/common/widgets/buttons/chevron_icon.dart';
import 'package:yoko_testwork/common/widgets/buttons/text_chevron_button.dart';
import 'package:yoko_testwork/common/widgets/style/custom_gradient.dart';
import 'package:yoko_testwork/const/colors.dart';
import 'package:yoko_testwork/const/text_styles.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: height * 0.4,
                  decoration: const BoxDecoration(
                    color: kPrimaryBlueColor,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/img/splash.png'),
                    ),
                  ),
                ),
                CustomGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  borderRadius: 0,
                  height: height * 0.4,
                  colors: [
                    kPrimaryBlueColor.withOpacity(0.5),
                    kSecondaryBlueColor.withOpacity(0.5),
                  ],
                ),
                CustomGradient(
                  begin: const FractionalOffset(0.5, -0.5),
                  end: FractionalOffset.center,
                  borderRadius: 0,
                  height: height * 0.4,
                  colors: [
                    Colors.black,
                    Colors.black.withOpacity(0),
                  ],
                ),
                CustomGradient(
                  begin: FractionalOffset.center,
                  end: const FractionalOffset(0.5, 1.5),
                  borderRadius: 0,
                  height: height * 0.4,
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black,
                  ],
                ),
                Container(
                  height: height * 0.4 - 15,
                  color: Colors.transparent,
                  child: const Center(
                    child: Text(
                      "Gorilla Chimba Park",
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
                Container(
                  margin: EdgeInsets.only(top: height * 0.4 - 50),
                  height: height * 0.6 + 50,
                  decoration: const BoxDecoration(
                    color: kWhite100,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 19),
                      const Text(
                        "Дата посещения",
                        style: kBlackBoldTextTS,
                      ),
                      const SizedBox(height: 3),
                      const Text(
                        "Подзаголовок в одну строку",
                        style: kBlackSmallTextTS,
                      ),
                      const SizedBox(height: 19),
                      const Divider(),
                      const Spacer(),
                      const Divider(),
                      TextChevronButton(
                        text: "Правила поведения в сноупарке",
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Divider(),
                      TextChevronButton(
                        text: "Позвонить",
                        isBlue: true,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(height: 3),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
