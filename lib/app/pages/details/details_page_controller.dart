
import 'package:pokedex/app/models/pokemon_model.dart';
import 'package:pokedex/app/pages/details/details_page_store.dart';

class DetailsPageController{

  final store = DetailsPageStore();

  PokemonModel get currentPokemon => store.currentPokemon;

}