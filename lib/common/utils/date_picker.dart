import 'package:flutter/material.dart';
import 'package:yoko_testwork/const/colors.dart';
import 'package:yoko_testwork/const/text_styles.dart';

Future<String?> datePicker(
  BuildContext context,
  List<String> dates,
) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Выберите дату'),
        content: ListView.builder(
          itemCount: dates.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pop(dates[i]);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: kPrimaryBlueColor),
                ),
                child: Text(dates[i], style: kBlackTextTS),
              ),
            );
          },
        ),
      );
    },
  );
}
