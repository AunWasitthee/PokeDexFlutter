import 'package:dartz/dartz.dart';

import '../../domain/domain.dart';
import '../../helper/helper.dart';
import '../data.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSourceImpl remoteDataSource;

  RepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<PokemonEntity>>> getPokemons(int offset) async {
    try {
      NamedApiResourceListModel pageResult =
          await remoteDataSource.getAllPokemons(offset);
      List<PokemonEntity> result = [];

      if (pageResult.results != null) {
        for (NamedApiResourceModel e in pageResult.results!) {
          PokemonModel pme =
              await remoteDataSource.getPokemonByName(e.name ?? '');
          result.add(pme.toEntity());
        }
      }
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }
}
