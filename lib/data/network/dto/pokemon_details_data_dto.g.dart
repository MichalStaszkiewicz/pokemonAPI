// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailsDataDto _$PokemonDetailsDataDtoFromJson(
        Map<String, dynamic> json) =>
    PokemonDetailsDataDto(
      abilities: _abilitiesFromJson(json['abilities'] as List),
      baseExperience: json['base_experience'] as int,
      forms: _formsFromJson(json['forms'] as List),
      moves: _movesFromJson(json['moves'] as List),
    );

Map<String, dynamic> _$PokemonDetailsDataDtoToJson(
        PokemonDetailsDataDto instance) =>
    <String, dynamic>{
      'abilities': instance.abilities,
      'base_experience': instance.baseExperience,
      'forms': instance.forms,
      'moves': instance.moves,
    };
