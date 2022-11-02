import 'package:json_annotation/json_annotation.dart';

part 'languages_model.g.dart';

@JsonSerializable()
class LanguagesModel {
  LanguagesModel({
    required this.code,
    required this.name,
  });

  @JsonKey(defaultValue: '', name: 'code')
  String code;

  @JsonKey(defaultValue: '', name: 'name')
  String name;

  factory LanguagesModel.fromJson(Map<String, dynamic> json) =>
      _$LanguagesModelFromJson(json);

  Map<String, dynamic> toJson() => _$LanguagesModelToJson(this);
}
