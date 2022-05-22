import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoko_testwork/common/utils/date_picker.dart';
import 'package:yoko_testwork/common/widgets/buttons/blue_text_button.dart';
import 'package:yoko_testwork/common/widgets/buttons/chevron_icon.dart';
import 'package:yoko_testwork/common/widgets/buttons/text_chevron_button.dart';
import 'package:yoko_testwork/const/colors.dart';
import 'package:yoko_testwork/const/text_styles.dart';
import 'package:yoko_testwork/models/activity/activity_model.dart';

import 'widgets/activity_image.dart';
import 'widgets/tariff_card.dart';

const double bgImageHeightRatio = 0.36;

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({
    Key? key,
    required this.activity,
  }) : super(key: key);

  final ActivityModel activity;

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  String selectedDate = "Выберите дату";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          ActivityImage(
            title: widget.activity.nameRu,
            img: widget.activity.imageUrl,
            height: height,
            bgImageHeightRatio: bgImageHeightRatio,
          ),
          Container(
            margin: EdgeInsets.only(top: height * bgImageHeightRatio - 50),
            height: height * (1 - bgImageHeightRatio) + 50,
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
                Expanded(
                  child: ListView(
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.all(0),
                    children: [
                      const Text(
                        "Дата посещения",
                        style: kBlackBoldTextTS,
                      ),
                      const SizedBox(height: 3),
                      const Text(
                        "Подзаголовок в одну строку",
                        style: kBlackSmallTextTS,
                      ),
                      const SizedBox(height: 12),
                      const Divider(),
                      const SizedBox(height: 12),
                      TextButton(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today_rounded),
                              const SizedBox(width: 10),
                              Text(selectedDate, style: kBlackTextTS),
                              const Spacer(),
                              const ChevronIcon(
                                size: 18,
                                isRight: true,
                              ),
                            ],
                          ),
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: const BorderSide(
                                color: kPrimaryGrayColor,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          selectedDate = await datePicker(
                                context,
                                widget.activity.availableDates,
                              ) ??
                              "Выберите дату";
                          setState(() {});
                        },
                      ),
                      const SizedBox(height: 16),
                      for (var p in widget.activity.tariffs)
                        TariffCard(title: p.nameRu, priceInfo: p.priceInfo),
                      const SizedBox(height: 16),
                      BlueTextButton(
                        title: "Перейти к оплате",
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                // const Spacer(),
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
                SizedBox(height: MediaQuery.of(context).padding.bottom),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
