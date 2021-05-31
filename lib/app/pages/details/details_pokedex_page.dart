import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/app/models/pokemon_model.dart';
import 'package:pokedex/app/models/type_model.dart';

class DetailsPokedexPage extends StatefulWidget {

  final List<PokemonModel> pokemons;
  final int indexCurrentPokemon;

  DetailsPokedexPage(this.pokemons, this.indexCurrentPokemon);

  @override
  _DetailsPokedexPageState createState() => _DetailsPokedexPageState();
}

class _DetailsPokedexPageState extends State<DetailsPokedexPage> {
  late Size size;

  final color = Colors.blue;

  final pokemonModel = PokemonModel(
    name: 'Squirtle',
    url: 'https://pokeapi.co/api/v2/pokemon/7',
    imageUrl:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png',
    types: [
      TypeModel(name: 'water', url: 'https://pokeapi.co/api/v2/type/11/'),
    ],
  );

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: color,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: size.height * 0.4,
                color: color,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                height: size.height * 0.6,
                width: size.width,
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        Text(
                          pokemonModel.name,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black54,
                          ),
                        ),
                        _typesPokemon()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          _imagePokemon(),
        ],
      ),
    );
  }

  _imagePokemon() {
    return Container(
      transform: Matrix4.translationValues(0.0, -120, 0.0),
      child: Center(
        child: Image.network(
          pokemonModel.imageUrl,
          scale: 3,
        ),
      ),
    );
  }

  _typesPokemon() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: pokemonModel.types
            .map<Widget>((e) => Chip(
                  backgroundColor: color,
                  avatar: _iconType(e.name),
                  shadowColor: color,
                  elevation: 4,
                  label: Text(
                    e.name,
                    style: TextStyle(color: Colors.white),
                  ),
                ))
            .toList(),
      ),
    );
  }

  _iconType(String assetName) {
    return SvgPicture.asset(
      'assets/types/$assetName.svg',
    );
  }
}
