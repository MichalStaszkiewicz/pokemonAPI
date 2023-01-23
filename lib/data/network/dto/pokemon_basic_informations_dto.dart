
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/pokemon_basic_informations.dart';
part 'pokemon_basic_informations_dto.g.dart';
  @JsonSerializable()
  class PokemonBasicInformationsDto {
  PokemonBasicInformationsDto({required this.name, required this.detailsURL});
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'url')
  String detailsURL;
  PokemonBasicInformations toDomain() {
    return PokemonBasicInformations(name: name, detailsURL: detailsURL);
  }
  factory PokemonBasicInformationsDto.fromJson(Map<String, dynamic> json) =>_$PokemonBasicInformationsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonBasicInformationsDtoToJson(this);
  }
