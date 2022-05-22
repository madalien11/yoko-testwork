import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoko_testwork/common/widgets/buttons/blue_text_button.dart';
import 'package:yoko_testwork/common/widgets/buttons/chevron_icon.dart';
import 'package:yoko_testwork/common/widgets/buttons/text_chevron_button.dart';
import 'package:yoko_testwork/const/colors.dart';
import 'package:yoko_testwork/const/text_styles.dart';

import 'widgets/activity_image.dart';

const double bgImageHeightRatio = 0.36;

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
        child: Stack(
          children: [
            ActivityImage(
              title: "Gorilla Chimba Park",
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
                              children: const [
                                Icon(Icons.calendar_today_rounded),
                                SizedBox(width: 10),
                                Text("Выберите дату", style: kBlackTextTS),
                                Spacer(),
                                ChevronIcon(
                                  size: 18,
                                  isRight: true,
                                ),
                              ],
                            ),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: const BorderSide(
                                  color: kPrimaryGrayColor,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {},
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: kGrayButtonColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Взрослый старше 23 лет",
                                    style: kBlackTextTS,
                                  ),
                                  Text(
                                    "4 930 ₸",
                                    style: kBlackSmallTextTS,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.remove_circle_outline,
                                  size: 28,
                                  color: kPrimaryBlueColor,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add_circle_outline,
                                  size: 28,
                                  color: kPrimaryBlueColor,
                                ),
                              ),
                            ],
                          ),
                        ),
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
                  const SizedBox(height: 3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
