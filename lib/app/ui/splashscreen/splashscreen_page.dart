import 'package:flutter/material.dart';
import 'package:pokedex/app/services/pokemon_service.dart';
import 'package:pokedex/colors.dart';

class SplashscreenPage extends StatefulWidget {

  @override
  _SplashscreenPageState createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {
@override
  void initState() {
    super.initState();
    final service = PokemonService();
    service.getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              primaryColor,
              primaryColor2,
              secondaryColor,
            ],
          ),
        ),
        child: Image.asset(
          'assets/images/poke.png',
          scale: 1.2,
        ),
      ),
    );
  }
}
