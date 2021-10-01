import 'package:flutter/material.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({Key key}) : super(key: key);

  @override
  _PokemonPageState createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
