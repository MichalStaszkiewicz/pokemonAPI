// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_basic_informations_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonBasicInformationsDto _$PokemonBasicInformationsDtoFromJson(
        Map<String, dynamic> json) =>
    PokemonBasicInformationsDto(
      name: json['name'] as String,
      detailsURL: json['url'] as String,
    );

Map<String, dynamic> _$PokemonBasicInformationsDtoToJson(
        PokemonBasicInformationsDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.detailsURL,
    };
