import 'package:json_annotation/json_annotation.dart';
import 'package:yoko_testwork/models/tariff/tariff_model.dart';

part 'activity_model.g.dart';

@JsonSerializable()
class ActivityModel {
  ActivityModel({
    required this.id,
    this.categoryName,
    required this.availableDates,
    required this.nameRu,
    required this.nameKk,
    required this.nameEn,
    required this.imageUrl,
    required this.code,
    required this.enabled,
    required this.dateRequired,
    required this.skiPassRequired,
    this.description,
    this.workingHours,
    required this.tariffs,
  });

  // @JsonKey(name: 'order_id')
  final int id;
  final String? categoryName;
  final List<String> availableDates;
  final String nameRu;
  final String nameKk;
  final String nameEn;
  final String imageUrl;
  final String code;
  final bool enabled;
  final bool dateRequired;
  final bool skiPassRequired;
  final String? description;
  final String? workingHours;
  final List<TariffModel> tariffs;

  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);
  Map<String, dynamic> toJson() => _$ActivityModelToJson(this);
}
