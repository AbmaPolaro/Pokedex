import 'package:flutter/material.dart';
import 'package:pokedex_app/model/class_data_pokemon.dart';

import 'package:pokedex_app/model/api/pokemon_api.dart';

class ListPokemonPresenter extends ChangeNotifier {
  List<Data> pokemonlist = [];

  final PokemonApi api;

  ListPokemonPresenter(this.api);

  void loadPokemon() async {
    pokemonlist = await api.getPokemons();

    notifyListeners();
  }
}
