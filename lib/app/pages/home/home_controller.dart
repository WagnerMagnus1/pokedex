import 'package:mobx/mobx.dart';
import 'package:pokedex/app/models/pokemon_model.dart';

import 'home_store.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  HomeStore homeStore = HomeStore();

  void getPokemonFiltered(String _text) {
    if (_text.length > 0) {
      final pokemonsFiltered = <PokemonModel>[];
      for (final pokemon in homeStore.pokemons) {
        final pokemonName = pokemon.name.toLowerCase();
        if (pokemonName.contains(_text.toLowerCase())) {
          pokemonsFiltered.add(pokemon);
        }
      }
      homeStore.setListPokemonFiltered(pokemonsFiltered);
    } else {
      homeStore.setListPokemonFiltered(homeStore.pokemons);
    }
  }
}
