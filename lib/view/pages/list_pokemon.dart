import 'package:flutter/material.dart';
import 'package:pokedex_app/model/class_data_pokemon.dart';
import 'package:provider/provider.dart';
import '../../presenter/list_pokemon_presenter.dart';

class ListaPokemons extends StatefulWidget {
  final ListPokemonPresenter presenter;
  const ListaPokemons(this.presenter, {super.key});

  @override
  State<ListaPokemons> createState() => _ListaPokemonsState();
}

class _ListaPokemonsState extends State<ListaPokemons> {
  List<Data> pokemon = [];

  @override
  void initState() {
    context.read<ListPokemonPresenter>().loadPokemon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pokedex'),
          actions: [
            Image.asset(
              'assets/pokebola_img.png',
              height: 40,
              width: 40,
            )
          ],
        ),
        body: Consumer<ListPokemonPresenter>(
          builder: (context, presenter, child) {
            return ListView.builder(
              itemCount: presenter.pokemonlist.length,
              itemBuilder: (context, index) {
                Data pokemons = presenter.pokemonlist[index];
                return Card(
                  child: ListTile(
                    title: Text(pokemons.name ?? ''),
                    leading: Image.network(pokemons.thumbnailImage ?? ''),
                    trailing: Text(pokemons.number ?? ''),
                    onTap: () {
                      Navigator.pushNamed(context, '/DetalhesPokemon',
                          arguments: pokemons);
                    },
                  ),
                );
              },
            );
          },
        ));
  }
}
