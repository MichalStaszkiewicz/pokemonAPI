import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:pokeapi/domain/business_logic/pokemon_logic.dart';

import '../../domain/model/pokemon_basic_informations.dart';
import '../../domain/model/pokemon_details.dart';

part 'pokemon_api_event.dart';
part 'pokemon_api_state.dart';

class PokemonApiBloc extends Bloc<PokemonApiEvent, PokemonApiState> {
  PokemonApiBloc() : super(PokemonApiInitial()) {
    loadPokemonList();
    loadPokemonDetails();
  }

  void loadPokemonList() {
    on<LoadPokemons>((event, emit) async {
      PokemonLogic pokemonLogic = PokemonLogic();
      emit(PokemonListLoaded(pokemons: await pokemonLogic.createPokemons()));
    });
  }

  void loadPokemonDetails() {
    on<LoadPokemonDetails>((event, emit) async {
      PokemonLogic pokemonLogic = PokemonLogic();
      emit(PokemonDetailsLoaded(
          pokemon_details: await pokemonLogic.pokemonDetails(event.url)));
    });
  }
}
