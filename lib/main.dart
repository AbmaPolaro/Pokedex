import 'package:flutter/material.dart';
import 'package:pokedex_app/presenter/list_pokemon_presenter.dart';
import 'package:pokedex_app/view/pages/list_pokemon.dart';
import 'package:provider/provider.dart';
import 'model/api/pokemon_api.dart';
import 'view/pages/details_pokemon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final api = PokemonApi();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ListPokemonPresenter(api),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => ListaPokemons(ListPokemonPresenter(api)),
          '/DetalhesPokemon': (context) => const DetalhesPokemon(),
        },
      ),
    );
  }
}
