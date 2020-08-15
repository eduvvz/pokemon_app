import 'package:flutter/material.dart';
import 'package:pokemon/service/httpService.dart';
import 'package:pokemon/service/pokemon.dart';

const pokemons = [
  {'name': 'pokemon 01'},
  {'name': 'pokemon 02'},
  {'name': 'pokemon 03'},
  {'name': 'pokemon 04'},
];

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  Future<List<Pokemon>> pokemons;

  initState() {
    super.initState();
    pokemons = HttpService().getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemons'),
      ),
      body: FutureBuilder<List<Pokemon>>(
        future: pokemons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return listBuilder(snapshot.data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return loader();
        },
      ),
    );
  }

  Widget loader() {
    return Center(
      child: SizedBox(
        child: CircularProgressIndicator(),
        height: 50.0,
        width: 50.0,
      ),
    );
  }

  ListView listBuilder(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          var pokemon = data[index];
          return ListTile(
            leading: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 44,
                minHeight: 44,
                maxWidth: 44,
                maxHeight: 44,
              ),
              child:
                  Image.asset('assets/images/pokebola.png', fit: BoxFit.cover),
            ),
            title: Text(pokemon.name),
            onTap: () => print('clicou no pokemon'),
          );
        });
  }
}
