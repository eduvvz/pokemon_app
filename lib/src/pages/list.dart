import 'package:flutter/material.dart';

const pokemons = [
  {'name': 'pokemon 01'},
  {'name': 'pokemon 02'},
  {'name': 'pokemon 03'},
  {'name': 'pokemon 04'},
];

class List extends StatefulWidget {
  List({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          ListTile(
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
            title: Text("Charizard"),
            onTap: () => print('clicou no pokemon'),
          )
        ],
      ),
    );
  }
}
