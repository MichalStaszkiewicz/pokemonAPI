part of 'pokemon_api_bloc.dart';

abstract class PokemonApiState extends Equatable {
  const PokemonApiState();

  @override
  List<Object> get props => [];
}

class PokemonApiInitial extends PokemonApiState {}

class PokemonApiLoaded extends PokemonApiState {
  PokemonApiLoaded({required this.pokemons});
  List<Pokemon> pokemons;

  @override
  List<Object> get props => [pokemons];
}

class PokemonApiDetails extends PokemonApiState {
  PokemonApiDetails({required this.details});
  PokemonDetailsData details;

  @override
  List<Object> get props => [details];
}
