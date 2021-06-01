import 'package:dio/dio.dart' show Dio;
import 'package:pokedex/app/models/pokemon_model.dart';
import 'package:pokedex/app/models/type_model.dart';

class PokemonRepository {
  Dio dio = Dio();

  PokemonRepository() {
    dio.options.baseUrl = 'https://pokeapi.co/api/v2/';
  }

  Future<List<PokemonModel>> getPokemons() async {
    List<PokemonModel> pokemonList = [];
    try {
      final response = await dio.get('pokemon?limit=120');
      if (response.statusCode == 200) {
        final listResult = response.data['results'];
        for(var item in listResult) {
          final pokemon = await getPokemonByUrl(item['url']);
          pokemonList.add(pokemon);
        }
        return pokemonList;
      } else {
        throw Exception("Erro ao acessar a api");
      }
    } catch (error) {
      return [];
    }
  }

  Future<PokemonModel> getPokemonByUrl(String url) async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final name = response.data['name'];
        final imageUrl = response.data['sprites']['other']['official-artwork']['front_default'];
        final types = await response.data['types'].map<TypeModel>((item) => TypeModel(name: item['type']['name'], url: item['type']['url'])).toList();
        return PokemonModel(name: name, url: url, imageUrl: imageUrl, types: types);
      } else {
        throw Exception("Erro ao acessar a api");
      }
    } catch (error) {
      throw Exception("Erro ao acessar a api");
    }
  }
}
