import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_flutter/data/data.dart';
import 'package:pokedex_flutter/domain/domain.dart';
import 'package:pokedex_flutter/presentation/bloc/pokemons_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => PokemonsBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => GetPokemons(locator()));

  // repository
  locator.registerLazySingleton<Repository>(
    () => RepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<RemoteDataSourceImpl>(
    () => RemoteDataSourceImpl(
      client: locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => http.Client());
}
