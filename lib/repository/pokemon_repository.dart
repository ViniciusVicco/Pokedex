import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/models/regions.dart';

class PokemonRepository {
  Dio dio = Dio();
  String baseUrl = 'https://pokeapi.co/api/v2/';
  String image;

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

  Future<PokemonModel> getOnePokemon(
      String url, Function isLoading, Function completed) async {
    dio.get(url);
    return null;
  }

  Future<String> getPokemonSprite(
      Function isLoading, Function completed) async {
    isLoading();
    final result = await dio.get(baseUrl + 'pokemon/ditto/');
    image = result.data['sprites']['front_default'];
    completed();
    return image;
  }
}
