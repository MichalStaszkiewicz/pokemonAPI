import '../../data/network/dto/pokemon_details_data_dto.dart';
import '../../data/network/dto/pokemon_basic_informations_dto.dart';

abstract class PokemonRepository {
  Future<List<PokemonBasicInformationsDto>> getPokemons();
  Future<PokemonDetailsDataDto> getPokemonDetails(String url);
}
