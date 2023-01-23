part of 'pokemon_api_bloc.dart';

abstract class PokemonApiEvent extends Equatable {
  const PokemonApiEvent();

  @override
  List<Object> get props => [];
}

class LoadPokemons extends PokemonApiEvent{
LoadPokemons();

}
class LoadPokemonDetails extends PokemonApiEvent{
LoadPokemonDetails({required  this.url});
String url;

}