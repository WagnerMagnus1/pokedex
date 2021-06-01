import 'package:mobx/mobx.dart';
import 'package:pokedex/app/models/pokemon_model.dart';
part 'details_page_store.g.dart';

class DetailsPageStore = _DetailsPageStoreBase with _$DetailsPageStore;

abstract class _DetailsPageStoreBase with Store {
  @observable
  PokemonModel currentPokemon = PokemonModel(
    name: '',
    url: '',
    imageUrl: '',
    types: [],
  );

  @action
  void changeCurrentPokemon(PokemonModel pokemonModel) =>
      currentPokemon = pokemonModel;
}
