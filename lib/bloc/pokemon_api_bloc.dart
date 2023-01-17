import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import '../models/pokemon.dart';
import '../models/pokemon_details.dart';

part 'pokemon_api_event.dart';
part 'pokemon_api_state.dart';

class PokemonApiBloc extends Bloc<PokemonApiEvent, PokemonApiState> {
  PokemonApiBloc() : super(PokemonApiInitial()) {
    fetchPokemon();
    getPokemonDetails();
  }

  void getPokemonDetails() {
    on<PokemonDetails>((event, emit) async {
      var response = await http.get(Uri.parse(event.pokemon.detailsURL));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
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

        emit(PokemonApiDetails(
            details: PokemonDetailsData(
                ability: abilities,
                baseExperience: result['base_experience'],
                forms: forms,
                moves: moves)));
      } else {
        print("Error: ${response.statusCode}");
      }
    });
  }

  void fetchPokemon() {
    on<PokemonFetchData>((event, emit) async {
      List<Pokemon> pokemons = [];
      String url = "https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0";
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        for (var pokemon in result["results"]) {
          pokemons
              .add(Pokemon(name: pokemon['name'], detailsURL: pokemon['url']));
        }
        emit(PokemonApiLoaded(pokemons: pokemons));
      } else {
        print("Error: ${response.statusCode}");
      }
    });
  }
}
