import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex_flutter/domain/domain.dart';

part 'pokemons_event.dart';
part 'pokemons_state.dart';

class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  final GetPokemons _getPokemonsUseCase;

  PokemonsBloc(this._getPokemonsUseCase) : super(PokemonsInitial()) {
    on<PokemonsEvent>((event, emit) {});

    on<GetPokemonAll>((event, emit) async {
      final response = await _getPokemonsUseCase.getPokemons(event.offset);
      response.fold((fail) {
        emit(PokemonsInitial());
      }, (data) {
        emit(HavePokemonsState(pokemons: data, amount: data.length));
      });
    });
  }
}
