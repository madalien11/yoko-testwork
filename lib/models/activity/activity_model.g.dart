// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityModel _$ActivityModelFromJson(Map<String, dynamic> json) =>
    ActivityModel(
      id: json['id'] as int,
      categoryName: json['categoryName'] as String?,
      availableDates: (json['availableDates'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      nameRu: json['nameRu'] as String,
      nameKk: json['nameKk'] as String,
      nameEn: json['nameEn'] as String,
      imageUrl: json['imageUrl'] as String,
      code: json['code'] as String,
      enabled: json['enabled'] as bool,
      dateRequired: json['dateRequired'] as bool,
      skiPassRequired: json['skiPassRequired'] as bool,
      description: json['description'] as String?,
      workingHours: json['workingHours'] as String?,
      tariffs: (json['tariffs'] as List<dynamic>)
          .map((e) => TariffModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ActivityModelToJson(ActivityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryName': instance.categoryName,
      'availableDates': instance.availableDates,
      'nameRu': instance.nameRu,
      'nameKk': instance.nameKk,
      'nameEn': instance.nameEn,
      'imageUrl': instance.imageUrl,
      'code': instance.code,
      'enabled': instance.enabled,
      'dateRequired': instance.dateRequired,
      'skiPassRequired': instance.skiPassRequired,
      'description': instance.description,
      'workingHours': instance.workingHours,
      'tariffs': instance.tariffs,
    };
