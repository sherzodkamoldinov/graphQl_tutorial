// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) => CountryModel(
      capital: json['capital'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      emoji: json['emoji'] as String? ?? '',
      languages: (json['languages'] as List<dynamic>?)
              ?.map((e) => LanguagesModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      name: json['name'] as String? ?? '',
      native: json['native'] as String? ?? '',
      code: json['code'] as String? ?? '',
    );

Map<String, dynamic> _$CountryModelToJson(CountryModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'native': instance.native,
      'capital': instance.capital,
      'emoji': instance.emoji,
      'currency': instance.currency,
      'languages': instance.languages,
    };
