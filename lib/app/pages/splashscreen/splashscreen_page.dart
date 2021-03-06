import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/app/pages/home/home_page.dart';
import 'package:pokedex/app/repositories/pokemon_repository.dart';
import 'package:pokedex/colors.dart';

class SplashscreenPage extends StatefulWidget {
  @override
  _SplashscreenPageState createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {
  @override
  void initState() {
    super.initState();
    getPokemons();
  }

  Future<void> getPokemons() async {
    final service = PokemonRepository();
    final pokemons = await service.getPokemons();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          pokemons: pokemons,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              primaryColor,
              primaryColor1,
              secondaryColor,
            ],
          ),
        ),
        child: Bounce(
          delay: Duration(seconds: 2),
          infinite: true,
          child: JelloIn(
            delay: Duration(seconds: 2),
            child: Image.asset(
              'assets/images/poke.png',
              scale: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
