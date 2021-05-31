import 'package:flutter/material.dart';

import 'package:pokedex/app/models/pokemon_model.dart';
import 'package:pokedex/colors.dart';

class HomePage extends StatefulWidget {
  List<PokemonModel> pokemons;

  HomePage({
    Key? key,
    required this.pokemons,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor0,
      appBar: AppBar(
        backgroundColor: appBarColor2,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Pokedex',
              style: TextStyle(color: black),
            ),
          ],
        ),
      ),
      body: Container(
        child: Text('HOME'),
      ),
    );
  }
}
