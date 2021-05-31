import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:pokedex/app/models/pokemon_model.dart';
import 'package:pokedex/app/pages/details/details_pokedex_page.dart';
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
  TextEditingController searchController = TextEditingController(text: '');

  List<PokemonModel> getPokemonFiltered(String _text) {
    if (_text.length >= 1) {
      final pokemons = <PokemonModel>[];
      for (final pokemon in widget.pokemons) {
        final pokemonName = pokemon.name.toLowerCase();
        if (pokemonName.contains(_text.toLowerCase())) {
          pokemons.add(pokemon);
        }
      }
      return pokemons;
    } else {
      return widget.pokemons;
    }
  }

  @override
  Widget build(BuildContext context) {
    var listPokemonsFilted = getPokemonFiltered(searchController.value.text);

    return Scaffold(
      backgroundColor: primaryColor0,
      appBar: AppBar(
        backgroundColor: appBarColor2,
        centerTitle: true,
        toolbarHeight: 125,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pokedex',
              style: TextStyle(color: black),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              textAlign: TextAlign.start,
              controller: searchController,
              onChanged: (String text) {
                setState(() {
                listPokemonsFilted = getPokemonFiltered(text);
                });
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: mono,
                ),
                hintText: 'Encontre um pokémon',
                hintStyle: TextStyle(fontSize: 16, color: mono),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(0),
                // fillColor: colorSearchBg,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 15),
        color: white,
        child: ListView.separated(
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Divider(
              color: divider,
              thickness: 1.0,
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 10),
          physics: BouncingScrollPhysics(),
          itemCount: listPokemonsFilted.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final pokemon = listPokemonsFilted[index];
            return ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              leading: Hero(
                tag: pokemon.imageUrl,
                child: Image.network(pokemon.imageUrl),
              ),
              title: Text(pokemon.name, style: TextStyle(color: mono1)),
              trailing: Container(
                width: 170,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: pokemon.types.length,
                    itemBuilder: (context, index) {
                      final type = pokemon.types[index];
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10, color: mono2, spreadRadius: 1)
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundColor: type.imageColorAvatar,
                          child: SvgPicture.asset(
                            type.imagePath,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              subtitle: Text(
                '#' + index.toString().padLeft(3, '0'),
                style: TextStyle(color: mono2),
              ),
              selectedTileColor: primaryColor0,
              selected: true,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailsPokedexPage(widget.pokemons, index)));
              },
            );
          },
        ),
      ),
    );
  }
}
