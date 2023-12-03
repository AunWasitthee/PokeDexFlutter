part of 'pokemons_bloc.dart';

abstract class PokemonsState extends Equatable {
  const PokemonsState();
}

class PokemonsInitial extends PokemonsState {
  final List<PokemonEntity> pokemons = [];
  PokemonsInitial();
  @override
  List<Object> get props => [pokemons];
}

class HavePokemonsState extends PokemonsState {
  final List<PokemonEntity> pokemons;
  final int amount;

  const HavePokemonsState({required this.pokemons, required this.amount});

  @override
  List<Object> get props => [pokemons, amount];
}
