import 'package:flutter/material.dart';
import 'package:yoko_testwork/const/colors.dart';
import 'package:yoko_testwork/const/text_styles.dart';
import 'package:yoko_testwork/models/price_info/price_info_model.dart';

class TariffCard extends StatefulWidget {
  const TariffCard({
    Key? key,
    required this.title,
    required this.priceInfo,
  }) : super(key: key);

  final String title;
  final PriceInfoModel priceInfo;

  @override
  State<TariffCard> createState() => _TariffCardState();
}

class _TariffCardState extends State<TariffCard> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kGrayButtonColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: kBlackTextTS,
              ),
              Text(
                "${widget.priceInfo.price} ${widget.priceInfo.currency} x $quantity = ${widget.priceInfo.price * quantity}",
                style: kBlackSmallTextTS,
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              if (quantity > 0) setState(() => quantity--);
            },
            icon: const Icon(
              Icons.remove_circle_outline,
              size: 28,
              color: kPrimaryBlueColor,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() => quantity++);
            },
            icon: const Icon(
              Icons.add_circle_outline,
              size: 28,
              color: kPrimaryBlueColor,
            ),
          ),
        ],
      ),
    );
  }
}
