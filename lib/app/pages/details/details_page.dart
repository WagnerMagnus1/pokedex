import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/app/models/pokemon_model.dart';
import 'package:pokedex/app/shared/stores/pokemon_store.dart';

class DetailsPage extends StatefulWidget {
  final List<PokemonModel> pokemons;
  final int indexCurrentPokemon;
  final PokemonStore store;

  DetailsPage({required this.pokemons, required this.indexCurrentPokemon, required this.store});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<PokemonModel> get pokemons => widget.pokemons;
  int get indexCurrentPokemon => widget.indexCurrentPokemon;

  late Size size;

  var _pageviewController = PageController();

  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      _pageviewController.jumpToPage(indexCurrentPokemon);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Observer(builder: (_) {
      return Scaffold(
        backgroundColor: widget.store.pokemonSelected.types.first.imageColorAvatar,
        appBar: AppBar(
          backgroundColor: widget.store.pokemonSelected.types.first.imageColorAvatar,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: size.height * 0.3,
                  color: widget.store.pokemonSelected.types.first.imageColorAvatar,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    height: size.height * 0.7,
                    width: size.width,
                    child: Container(
                      margin: EdgeInsets.only(top: 50, bottom: 30),
                      child: Column(
                        children: [
                          Text(
                            widget.store.pokemonSelected.name,
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
            _pageViewPokemons(),
          ],
        ),
      );
    });
  }

  _pageViewPokemons() {
    return PageView.builder(
      controller: _pageviewController,
      itemCount: widget.pokemons.length,
      onPageChanged: (int page) {
        widget.store.setPokemonSelected(pokemons[page]);
      },
      scrollBehavior: ScrollBehavior(),
      itemBuilder: (context, index) {
        return Hero(
          tag: widget.store.pokemonSelected.imageUrl,
          child: Container(
            transform: Matrix4.translationValues(0.0, -size.height / 5, 0.0),
            child: Image.network(
              widget.store.pokemonSelected.imageUrl,
              scale: 3,
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
        children: widget.store.pokemonSelected.types
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
