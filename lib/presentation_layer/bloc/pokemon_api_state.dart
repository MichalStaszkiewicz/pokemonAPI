part of 'pokemon_api_bloc.dart';

abstract class PokemonApiState extends Equatable {
  const PokemonApiState();

  @override
  List<Object> get props => [];
}

class PokemonApiInitial extends PokemonApiState {}

class PokemonListLoaded extends PokemonApiState {
  PokemonListLoaded({required this.pokemons});
  List<PokemonBasicInformations> pokemons;

  @override
  List<Object> get props => [pokemons];
}
class PokemonDetailsLoaded extends PokemonApiState{
  PokemonDetailsLoaded({required this.pokemon_details});
  PokemonDetailsData pokemon_details;
  @override 

  List<Object> get props =>[pokemon_details];
  }
