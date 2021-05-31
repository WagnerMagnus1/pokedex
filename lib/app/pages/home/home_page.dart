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
              // controller: searchCtrl,
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
          itemCount: widget.pokemons.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final pokemon = widget.pokemons[index];
            return ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: Image.network(pokemon.imageUrl),
              title: Text(pokemon.name, style: TextStyle(color: mono1)),
              subtitle: Text(index.toString().padLeft(3, '#0'), style: TextStyle(color: mono2),),
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
