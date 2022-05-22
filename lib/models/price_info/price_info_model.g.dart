// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceInfoModel _$PriceInfoModelFromJson(Map<String, dynamic> json) =>
    PriceInfoModel(
      enabled: json['enabled'] as bool,
      price: json['price'] as double,
      currency: json['currency'] as String,
      hasPickupBox: json['hasPickupBox'] as bool,
      pickupBoxPrice: json['pickupBoxPrice'] as int?,
      date: json['date'] as String,
    );

Map<String, dynamic> _$PriceInfoModelToJson(PriceInfoModel instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'price': instance.price,
      'currency': instance.currency,
      'hasPickupBox': instance.hasPickupBox,
      'pickupBoxPrice': instance.pickupBoxPrice,
      'date': instance.date,
    };
