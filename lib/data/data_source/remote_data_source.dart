import 'dart:convert';

import '../../helper/helper.dart';
import '../data.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<NamedApiResourceListModel> getAllPokemons(int offset);
  Future<PokemonModel> getPokemonByName(String name);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

  @override
  Future<NamedApiResourceListModel> getAllPokemons(int offset) async {
    final response = await client.get(Uri.parse(
        'https://pokeapi.co/api/v2/pokemon/?offset=$offset&limit=10'));
    if (response.statusCode == 200) {
      NamedApiResourceListModel ppe =
          NamedApiResourceListModel.fromJson((json.decode(response.body)));
      return ppe;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PokemonModel> getPokemonByName(String name) async {
    final result =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'));
    if (result.statusCode == 200) {
      return PokemonModel.fromJson(jsonDecode(result.body));
    } else {
      throw ServerException();
    }
  }
}
