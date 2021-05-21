
import 'package:dio/dio.dart' show Dio;

class PokemonService {
  Dio dio = Dio();

  PokemonService() {
    dio.options.baseUrl = 'https://pokeapi.co/api/v2/';
  }

  Future<void> getPokemons() async {
    try {
      final result = await dio.get('pokemon?limit=150');
      print(result);
    } catch (error) {
      print(error);
    }
  }
}
