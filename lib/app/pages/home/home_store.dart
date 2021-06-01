import 'package:mobx/mobx.dart';
import 'package:pokedex/app/models/pokemon_model.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {

  @observable
  ObservableList<PokemonModel> pokemons = <PokemonModel>[].asObservable();

  @observable
  ObservableList<PokemonModel> pokemonsFiltered = <PokemonModel>[].asObservable();

  @observable
  String urlPokemonSelected = '';

  @action
  void setListPokemon(List<PokemonModel> value) => pokemons = value.asObservable();

  @action
  void setListPokemonFiltered(List<PokemonModel> value) => pokemonsFiltered = value.asObservable();

  @action
  void setUrlPokemonSelected(String value) => urlPokemonSelected = value;
}
