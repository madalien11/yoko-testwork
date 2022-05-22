import 'package:json_annotation/json_annotation.dart';

part 'price_info_model.g.dart';

@JsonSerializable()
class PriceInfoModel {
  PriceInfoModel({
    required this.enabled,
    required this.price,
    required this.currency,
    required this.hasPickupBox,
    this.pickupBoxPrice,
    required this.date,
  });

  final bool enabled;
  final double price;
  final String currency;
  final bool hasPickupBox;
  final int? pickupBoxPrice;
  final String date;

  factory PriceInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PriceInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$PriceInfoModelToJson(this);
}
