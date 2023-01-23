import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/pokemon_details.dart';
part 'pokemon_details_data_dto.g.dart';
@JsonSerializable()
class PokemonDetailsDataDto {
  PokemonDetailsDataDto({
    required this.abilities,
    required this.baseExperience,
    required this.forms,
    required this.moves,
  });
  @JsonKey(name: 'abilities')
  final List<String> abilities;
  @JsonKey(name: 'base_experience')
  final int baseExperience;
  @JsonKey(name: 'forms')
  final List<String> forms;
  @JsonKey(name: 'moves')
  final List<String> moves;
  PokemonDetailsData toDomain() {
    return PokemonDetailsData(
      ability: abilities,
      baseExperience: baseExperience,
      forms: forms,
      moves: moves,
    );
  }
factory PokemonDetailsDataDto.fromJson(Map<String, dynamic> json) =>_$PokemonDetailsDataDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonDetailsDataDtoToJson(this);
}
