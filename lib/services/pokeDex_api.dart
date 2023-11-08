import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_pokedex_app/model/pokemon_model.dart';

class PokiApi {
  static const String _url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  static Future<List<PokemonModel>> getPokemonData() async {
    List<PokemonModel> _list = [];

    var result = await Dio().get(_url);

    var pokeList = jsonDecode(
        result.data)['pokemon']; //gelen veri string oldugu icin decode yaptik

    if (pokeList is List) {
      _list = pokeList.map((e) => PokemonModel.fromJson(e)).toList();
    } else {
      return [];
    }

    return _list;
  }
}
