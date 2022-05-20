import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoko_testwork/const/colors.dart';
import 'package:yoko_testwork/const/text_styles.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: SvgPicture.asset(
                      "assets/svg/chevron_left.svg",
                      fit: BoxFit.scaleDown,
                      semanticsLabel: 'Chevron Left',
                      color: kPrimaryBlueColor,
                    ),
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Активности',
                    textAlign: TextAlign.center,
                    style: kAppBarBlackTS,
                  ),
                ),
                const SizedBox(
                  height: 50,
                  width: 50,
                ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: const [
                  ActivityCard(),
                  ActivityCard(),
                  ActivityCard(),
                  ActivityCard(),
                  ActivityCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            height: 226,
            decoration: BoxDecoration(
              color: kPrimaryBlueColor,
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/img/splash.png',
                ),
              ),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
          ),
          const ActivityCardBlackGradient(),
          const ActivityCardBlueGradient(),
          Container(
            height: 226,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Gorilla Chimba Park",
                  style: kActivityCardTitleTS,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: const Text(
                    "Оплачивайте частые услуги просто!",
                    style: kActivityCardSubtitleTS,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ActivityCardBlueGradient extends StatelessWidget {
  const ActivityCardBlueGradient({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 226,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: const FractionalOffset(0.5, 1.3),
          end: const FractionalOffset(0.5, 0.2),
          colors: [
            kSecondaryBlueColor,
            kPrimaryBlueColor.withOpacity(0.0),
          ],
          stops: const [0.0, 1.0],
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
    );
  }
}

class ActivityCardBlackGradient extends StatelessWidget {
  const ActivityCardBlackGradient({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 226,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: const FractionalOffset(0.5, -0.5),
          end: FractionalOffset.center,
          colors: [
            Colors.black,
            Colors.black.withOpacity(0.0),
          ],
          stops: const [0.0, 1.0],
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
    );
  }
}
