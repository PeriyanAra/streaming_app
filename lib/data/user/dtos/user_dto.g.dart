// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDtoImpl _$$UserDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserDtoImpl(
      name: json['name'] as String,
      birthday: DateTime.parse(json['birthday'] as String),
      gender: $enumDecode(_$GenderTypeEnumMap, json['gender']),
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$UserDtoImplToJson(_$UserDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'birthday': instance.birthday.toIso8601String(),
      'gender': _$GenderTypeEnumMap[instance.gender]!,
      'photos': instance.photos,
    };

const _$GenderTypeEnumMap = {
  GenderType.male: 'male',
  GenderType.female: 'female',
  GenderType.other: 'other',
};
