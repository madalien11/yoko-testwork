import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoko_testwork/common/widgets/buttons/chevron_icon.dart';
import 'package:yoko_testwork/const/text_styles.dart';

import 'widgets/activity_card.dart';

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
                ChevronIcon(
                  size: 50,
                  onTap: () {
                    Navigator.pop(context);
                  },
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
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: 10,
                itemBuilder: (context, index) => const ActivityCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
