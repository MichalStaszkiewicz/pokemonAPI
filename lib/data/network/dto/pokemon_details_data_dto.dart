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
  @JsonKey(name: 'abilities', fromJson: _abilitiesFromJson)
  final List<String> abilities;
  @JsonKey(name: 'base_experience')
  final int baseExperience;
  @JsonKey(name: 'forms', fromJson: _formsFromJson)
  final List<String> forms;
  @JsonKey(name: 'moves', fromJson: _movesFromJson)
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

List<String> _abilitiesFromJson(List<dynamic> abilities) {
return abilities.map((e) => e['ability']['name'].toString()).toList();
}

List<String> _formsFromJson(List<dynamic> forms) {
return forms.map((e) => e['name'].toString()).toList();
}
List<String> _movesFromJson(List<dynamic> moves) {
return moves.map((e) => e['move']['name'].toString()).toList();
}