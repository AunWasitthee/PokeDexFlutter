import 'package:dartz/dartz.dart';

import '../../helper/helper.dart';
import '../domain.dart';

class GetPokemons {
  final Repository repository;

  GetPokemons(this.repository);

  Future<Either<Failure, List<PokemonEntity>>> getPokemons(int offset) async {
    return await repository.getPokemons(offset);
  }
}
