import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/app/models/pokemon_model.dart';

class DetailsPokedexPage extends StatefulWidget {
  final List<PokemonModel> pokemons;
  final int indexCurrentPokemon;

  DetailsPokedexPage(this.pokemons, this.indexCurrentPokemon);

  @override
  _DetailsPokedexPageState createState() => _DetailsPokedexPageState();
}

class _DetailsPokedexPageState extends State<DetailsPokedexPage> {
  late Size size;
  late PokemonModel currentPokemon;

  var _pageController = PageController();

  @override
  void initState() {
    currentPokemon = widget.pokemons[widget.indexCurrentPokemon];

    //Faz o pageview pular para o index do pokemon selecionado
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      _pageController.jumpToPage(widget.indexCurrentPokemon);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: currentPokemon.types.first.imageColorAvatar,
      appBar: AppBar(
        backgroundColor: currentPokemon.types.first.imageColorAvatar,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: size.height * 0.3,
                  color: currentPokemon.types.first.imageColorAvatar,
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
                            currentPokemon.name,
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
          ),
          _pageViewPokemons(),
        ],
      ),
    );
  }

  _pageViewPokemons() {
    return PageView.builder(
      controller: _pageController,
      itemCount: widget.pokemons.length,
      onPageChanged: (int page) {
        currentPokemon = widget.pokemons[page];

        setState(() {});
      },
      itemBuilder: (context, index) {
        return Hero(
          tag: currentPokemon.imageUrl,
          child: Container(
            transform: Matrix4.translationValues(0.0, -150, 0.0),
            child: Center(
              child: Image.network(
                currentPokemon.imageUrl,
                scale: 3,
              ),
            ),
          ),
        );
      },
    );
  }

  _typesPokemon() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: currentPokemon.types
            .map<Widget>((e) => Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Chip(
                    backgroundColor: e.imageColorAvatar,
                    avatar: SvgPicture.asset(e.imagePath),
                    shadowColor: e.imageColorAvatar,
                    elevation: 4,
                    label: Text(
                      e.name,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
