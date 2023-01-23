import '../../data/network/dto/pokemon_details_data_dto.dart';
import '../../data/network/dto/pokemon_basic_informations_dto.dart';
import '../../data/repository_implementation/pokemon_repository.dart';

import '../model/pokemon_basic_informations.dart';
import '../model/pokemon_details.dart';

class PokemonLogic {
  PokemonApiRepository repo = PokemonApiRepository();
  Future<List<PokemonBasicInformations>> createPokemons() async {
    List<PokemonBasicInformationsDto> basicInfoDto = await repo.getPokemons();
    List<PokemonBasicInformations> basicInfo = [];
    for (PokemonBasicInformationsDto item in basicInfoDto) {
      basicInfo.add(item.toDomain());
    }
 
    return basicInfo;
  }

  Future<PokemonDetailsData> pokemonDetails(String url) async {
    PokemonDetailsData details =
        await repo.getPokemonDetails(url).then((value) => value.toDomain());
        return details;
  }
}
