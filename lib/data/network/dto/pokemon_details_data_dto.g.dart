// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailsDataDto _$PokemonDetailsDataDtoFromJson(
        Map<String, dynamic> json) =>
    PokemonDetailsDataDto(
      abilities:
          (json['abilities'] as List<dynamic>).map((e) => e as String).toList(),
      baseExperience: json['base_experience'] as int,
      forms: (json['forms'] as List<dynamic>).map((e) => e as String).toList(),
      moves: (json['moves'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PokemonDetailsDataDtoToJson(
        PokemonDetailsDataDto instance) =>
    <String, dynamic>{
      'abilities': instance.abilities,
      'base_experience': instance.baseExperience,
      'forms': instance.forms,
      'moves': instance.moves,
    };
