import 'package:flutter/material.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/pages/pokemon_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      initialRoute: '/',
      routes: {
        '/pokemon': (context) => const PokemonPage(),
        //  '/novaRota': (context) => const NomePagina(),
      },
    );
  }
}
