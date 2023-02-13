import 'package:flutter/material.dart';
import 'package:pokedex_app/model/class_data_pokemon.dart';

class DetalhesPokemon extends StatefulWidget {
  const DetalhesPokemon({super.key});

  @override
  State<DetalhesPokemon> createState() => _DetalhesPokemonState();
}

class _DetalhesPokemonState extends State<DetalhesPokemon> {
  dynamic get style => null;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Data;
    return Scaffold(
        appBar: AppBar(
          title: Text(args.name ?? ''),
        ),
        body: Card(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(alignment: Alignment.topRight, children: [
                        Container(
                          width: double.maxFinite,
                          color: Colors.grey[100],
                          child: Center(
                            child: Image.network(
                              args.thumbnailImage ?? '',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('#${args.number ?? ''}'),
                        ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(args.description ?? ''),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Card(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Tipo:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('${args.type}'),
                              const SizedBox(
                                height: 30,
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Card(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Fraquezas:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('${args.weakness}'),
                        ],
                      ))
                    ]))));
  }
}
