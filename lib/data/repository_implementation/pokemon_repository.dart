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
              PokemonBasicInformationsDto.fromJson(pokemon));
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
 
      return PokemonDetailsDataDto.fromJson(result);
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
