import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';

class PokemonPage extends StatefulWidget {
  final PokemonModel pokemon;
  static const String routeName = '/PokemonPage';
  const PokemonPage({Key key, this.pokemon}) : super(key: key);

  @override
  _PokemonPageState createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokemon.name),
      ),
      body: Container(
        child: Center(
          child: IconButton(
            icon: Icon(Icons.arrow_left),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
