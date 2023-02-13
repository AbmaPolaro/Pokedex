import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex_app/model/class_data_pokemon.dart';

class PokemonApi {
  List<Data> list = [];
  Future<List<Data>> getPokemons() async {
    try {
      var response = await http
          .get(Uri.parse("http://104.131.18.84/pokemon/?limit=50&page=0"));
      if (response.statusCode == 200) {
        Map json = const JsonDecoder().convert(response.body);
        for (var e in (json['data'] as List)) {
          list.add(Data.fromJson(e));
        }
        return list;
      }
      return list;
    } catch (e) {}

    throw {print('erro')};
  }
}
