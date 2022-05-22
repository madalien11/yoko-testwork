// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tariff_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TariffModel _$TariffModelFromJson(Map<String, dynamic> json) => TariffModel(
      id: json['id'] as int,
      nameRu: json['nameRu'] as String,
      nameKk: json['nameKk'] as String,
      nameEn: json['nameEn'] as String,
      code: json['code'] as String,
      enabled: json['enabled'] as bool,
      axessMetaTariffId: json['axessMetaTariffId'] as int,
      priceInfo:
          PriceInfoModel.fromJson(json['priceInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TariffModelToJson(TariffModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameRu': instance.nameRu,
      'nameKk': instance.nameKk,
      'nameEn': instance.nameEn,
      'code': instance.code,
      'enabled': instance.enabled,
      'axessMetaTariffId': instance.axessMetaTariffId,
      'priceInfo': instance.priceInfo,
    };
