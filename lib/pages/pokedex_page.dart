import 'package:flutter/material.dart';

class PokedexPage extends StatefulWidget {
  static const String routeName = '/PokedexPage';
  const PokedexPage({Key key}) : super(key: key);

  @override
  _PokedexPageState createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PokedexPage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: (Icon(Icons.arrow_left)),
          )
        ],
      ),
    );
  }
}
