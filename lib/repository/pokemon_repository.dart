import 'package:dio/dio.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/models/regions.dart';

class PokemonController {
  Dio dio = Dio();
  String url = 'https://pokeapi.co/api/v2/';

  Future<List<PokemonModel>> getPokemonsAllFromKanto(
      RegionPokedex regionPokedex,
      Function isLoading,
      Function completed) async {
    isLoading();
    Map<String, int> regions = regionPokedex.range;
    int offset = regions['offset'];
    int limit = regions['limit'];

    final response = await dio
        .get("https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset");
    List<dynamic> lista = response.data['results'];
    List<PokemonModel> listaPokemon = lista.map((e) {
      return PokemonModel.fromJson(e);
    }).toList();
    completed();
    return listaPokemon;
  }
}
