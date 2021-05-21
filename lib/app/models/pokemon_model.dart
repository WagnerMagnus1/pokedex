import 'package:pokedex/app/models/type_model.dart';

class PokemonModel {
  late String name;
  late String url;
  late String imageUrl;
  late List<TypeModel> types;

  PokemonModel({required this.name, required this.url, required this.imageUrl, required this.types});

  PokemonModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    imageUrl = json['imageUrl'];
    if (json['types'] != null) {
      types = <TypeModel>[];
      json['types'].forEach((v) {
        types.add(TypeModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['imageUrl'] = this.imageUrl;
    data['types'] = this.types.map((v) => v.toJson()).toList();
    return data;
  }
}
