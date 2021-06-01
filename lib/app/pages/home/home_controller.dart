import 'package:mobx/mobx.dart';
import 'package:pokedex/app/models/pokemon_model.dart';
import 'package:pokedex/app/shared/stores/pokemon_store.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  PokemonStore pokemonStore = PokemonStore();

  void getPokemonFiltered(String _text) {
    if (_text.length > 0) {
      final pokemonsFiltered = <PokemonModel>[];
      for (final pokemon in pokemonStore.pokemons) {
        final pokemonName = pokemon.name.toLowerCase();
        if (pokemonName.contains(_text.toLowerCase())) {
          pokemonsFiltered.add(pokemon);
        }
      }
      pokemonStore.setListPokemonFiltered(pokemonsFiltered);
    } else {
      pokemonStore.setListPokemonFiltered(pokemonStore.pokemons);
    }
  }
}
