import 'package:dio/dio.dart';
import 'package:pokeapi/data/network/dto/pokemon_basic_informations_dto.dart';
import 'package:pokeapi/data/network/dto/pokemon_details_data_dto.dart';

import 'package:pokeapi/domain/repositories/repository_interfaces.dart';

class PokemonApiRepository extends PokemonRepository {
  @override
  Future<List<PokemonBasicInformationsDto>> getPokemons() async {
    List<PokemonBasicInformationsDto> pokemons = [];
    String url = "https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0";
    Dio dio = Dio();
    try {
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        var result = response.data;
        for (var pokemon in result["results"]) {
          pokemons.add(
              PokemonBasicInformationsDto(name: pokemon['name'], detailsURL: pokemon['url']));
        }
      } else {
        throw Exception("Error: ${response.statusCode}");
      }
    } catch (error, stackTrace) {
      print("Error: $error");
      print("Stack Trace: $stackTrace");
      rethrow;
    }
    return pokemons;
  }

  @override
  Future<PokemonDetailsDataDto> getPokemonDetails(String url) async {
    try {
      Dio dio = Dio();
      var response = await dio.get(url);
      var result = response.data;
      List<String> abilities = [];
      List<String> forms = [];
      List<String> moves = [];
      for (var ability in result['abilities']) {
        abilities.add(ability['ability']['name']);
      }
      for (var form in result['forms']) {
        forms.add(form['name']);
      }
      for (var move in result['moves']) {
        moves.add(move['move']['name']);
      }
      return PokemonDetailsDataDto(
          abilities: abilities,
          baseExperience: result['base_experience'],
          forms: forms,
          moves: moves);
    } catch (error) {
      if (error is DioError) {
        print("Error: ${error.response}");
        rethrow;
      } else {
        rethrow;
      }
    }
  }
}
