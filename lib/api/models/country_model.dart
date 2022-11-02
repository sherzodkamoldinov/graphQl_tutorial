import 'package:graphql_tutorial/api/models/languages_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_model.g.dart';

@JsonSerializable()
class CountryModel {
  CountryModel({
    required this.capital,
    required this.currency,
    required this.emoji,
    required this.languages,
    required this.name,
    required this.native,
    required this.code
  });

  @JsonKey(defaultValue: '', name: 'code')
  String code;

  @JsonKey(defaultValue: '', name: 'name')
  String name;

  @JsonKey(defaultValue: '', name: 'native')
  String native;

  @JsonKey(defaultValue: '', name: 'capital')
  String capital;

  @JsonKey(defaultValue: '', name: 'emoji')
  String emoji;

  @JsonKey(defaultValue: '', name: 'currency')
  String currency;

  @JsonKey(defaultValue: [], name: 'languages')
  List<LanguagesModel> languages;

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryModelToJson(this);
}
