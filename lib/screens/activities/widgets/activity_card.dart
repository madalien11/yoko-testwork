import 'package:flutter/material.dart';
import 'package:yoko_testwork/common/widgets/style/custom_gradient.dart';
import 'package:yoko_testwork/const/colors.dart';
import 'package:yoko_testwork/const/text_styles.dart';
import 'package:yoko_testwork/models/activity/activity_model.dart';
import 'package:yoko_testwork/screens/activities/activity/activity_screen.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    Key? key,
    required this.activityModel,
  }) : super(key: key);

  final ActivityModel activityModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ActivityScreen(
              activity: activityModel,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            height: 226,
            decoration: BoxDecoration(
              color: kPrimaryBlueColor,
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(activityModel.imageUrl),
              ),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
          ),
          CustomGradient(
            begin: const FractionalOffset(0.5, -0.5),
            end: FractionalOffset.center,
            colors: [
              Colors.black,
              Colors.black.withOpacity(0.0),
            ],
            verticalMargin: 8,
          ),
          CustomGradient(
            begin: const FractionalOffset(0.5, 1.3),
            end: const FractionalOffset(0.5, 0.2),
            colors: [
              kSecondaryBlueColor,
              kPrimaryBlueColor.withOpacity(0.0),
            ],
            verticalMargin: 8,
          ),
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
                Text(
                  activityModel.nameRu,
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
