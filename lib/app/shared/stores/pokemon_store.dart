import 'package:mobx/mobx.dart';
import 'package:pokedex/app/models/pokemon_model.dart';

part 'pokemon_store.g.dart';

class PokemonStore = _PokemonStoreBase with _$PokemonStore;

abstract class _PokemonStoreBase with Store {
  @observable
  ObservableList<PokemonModel> pokemons = <PokemonModel>[].asObservable();

  @observable
  ObservableList<PokemonModel> pokemonsFiltered = <PokemonModel>[].asObservable();

  @observable
  PokemonModel pokemonSelected = PokemonModel(url: '', types: [], imageUrl: '', name: '');

  @action
  void setListPokemon(List<PokemonModel> value) => pokemons = value.asObservable();

  @action
  void setListPokemonFiltered(List<PokemonModel> value) => pokemonsFiltered = value.asObservable();

  @action
  void setPokemonSelected(PokemonModel pokemon) => pokemonSelected = pokemon;
}
