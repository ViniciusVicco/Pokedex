import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/models/regions.dart';
import 'package:pokedex/pages/pokedex_page.dart';
import 'package:pokedex/repository/pokemon_repository.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PokemonRepository repository = PokemonRepository();
  bool isLoading = false;
  bool isComplete = false;
  bool hasError = false;
  String image = '';
  List<PokemonModel> pokemonModel = [];
  Color backgroundColor = Colors.white;
  @override
  void initState() {
    super.initState();
  }

  void onLoading() {
    setState(() {
      isLoading = true;
      isComplete = false;
      hasError = false;
    });
  }

  void onError() {
    setState(() {
      backgroundColor = Colors.red;
      isLoading = false;
      isComplete = false;
      hasError = false;
    });
  }

  void onCompleted() {
    setState(() {
      isComplete = true;
      isLoading = false;
      hasError = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Pokedex"),
      ),
      body: StreamBuilder<Object>(
          stream: null,
          builder: (context, snapshot) {
            if (isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            // if (isComplete) {
            //   return Image.network(repository.image);
            // }
            if (isComplete && pokemonModel.isNotEmpty) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Text(pokemonModel[index].name);
                },
                itemCount: pokemonModel.length,
              );
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_right),
                    onPressed: () {
                      // Navigator.of(context).pushNamed(PokemonPage.routeName,
                      //     arguments:
                      //         PokemonModel(name: "Charmander", url: "-"));
                      Navigator.of(context).pushNamed(
                        PokedexPage.routeName,
                      );
                    },
                  ),
                  Text(
                    '',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          pokemonModel = await repository.getPokemonsAllFromKanto(
              RegionPokedex.jhoto, onLoading, onCompleted);
          setState(() {
            backgroundColor = RegionPokedex.jhoto.color;
          });
          // setState(() {
          //   repository.getPokemonSprite(onLoading, onCompleted);
          // });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
