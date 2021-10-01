import 'package:flutter/material.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/pages/home_page.dart';
import 'package:pokedex/pages/pokedex_page.dart';
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
      onGenerateRoute: (settings) {
        if (settings.name == PokemonPage.routeName) {
          // Compara se a rota existe
          final args = settings.arguments
              as PokemonModel; //Tipando o seu argumento que será enviado para página;
          return MaterialPageRoute(
            //Define a rota
            builder: (context) {
              return PokemonPage(
                //Constroi a página
                pokemon: args,
              );
            },
          );
        }
        if (settings.name == PokedexPage.routeName) {
          return MaterialPageRoute(
            builder: (context) {
              return const PokedexPage();
            },
          );
        }
        return null;
      },
    );
  }
}
