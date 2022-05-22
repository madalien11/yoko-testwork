import 'package:json_annotation/json_annotation.dart';
import 'package:yoko_testwork/models/price_info/price_info_model.dart';

part 'tariff_model.g.dart';

@JsonSerializable()
class TariffModel {
  TariffModel({
    required this.id,
    required this.nameRu,
    required this.nameKk,
    required this.nameEn,
    required this.code,
    required this.enabled,
    required this.axessMetaTariffId,
    required this.priceInfo,
  });

  final int id;
  final String nameRu;
  final String nameKk;
  final String nameEn;
  final String code;
  final bool enabled;
  final int axessMetaTariffId;
  final PriceInfoModel priceInfo;

  factory TariffModel.fromJson(Map<String, dynamic> json) =>
      _$TariffModelFromJson(json);
  Map<String, dynamic> toJson() => _$TariffModelToJson(this);
}
