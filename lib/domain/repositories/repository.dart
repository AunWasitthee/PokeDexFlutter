import 'package:dartz/dartz.dart';
import 'package:pokedex_flutter/helper/helper.dart';

import '../domain.dart';

abstract class Repository {
  Future<Either<Failure, List<PokemonEntity>>> getPokemons(int offset);
}
