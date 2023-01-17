part of 'pokemon_api_bloc.dart';

abstract class PokemonApiEvent extends Equatable {
  const PokemonApiEvent();

  @override
  List<Object> get props => [];
}

class PokemonFetchData extends PokemonApiEvent {
  PokemonFetchData();
}

class PokemonDetails extends PokemonApiEvent {
  PokemonDetails({required this.pokemon});
  Pokemon pokemon;
  @override
  List<Object> get props => [pokemon];
}
