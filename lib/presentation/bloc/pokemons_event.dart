part of 'pokemons_bloc.dart';

abstract class PokemonsEvent extends Equatable {
  @override
  List<Object> get props => [];
  const PokemonsEvent();
}

class GetPokemonAll extends PokemonsEvent {
  final int offset;

  const GetPokemonAll(this.offset);

  @override
  List<Object> get props => [offset];
}
