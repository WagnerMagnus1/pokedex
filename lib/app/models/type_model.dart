import 'package:flutter/material.dart';

class TypeModel {
  late String name;
  late String url;

  TypeModel({required this.name, required this.url});

  TypeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }

  String get imagePath {
    return 'assets/types/$name.svg';
  }

  Color get imageColorAvatar {
    Color color;
    switch (name) {
      case 'bug':
        color = Color(0xFFAAB734);
        break;
      case 'dark':
        color = Color(0xFF695748);
        break;
      case 'dragon':
        color = Color(0xFF6238f7);
        break;
      case 'electric':
        color = Color(0xFFedcf41);
        break;
      case 'fairy':
        color = Color(0xFFc284aa);
        break;
      case 'fighting':
        color = Color(0xFFa7312c);
        break;
      case 'fire':
        color = Color(0xFFd57f3a);
        break;
      case 'flying':
        color = Color(0xFFa18ef0);
        break;
      case 'ghost':
        color = Color(0xFF6c5894);
        break;
      case 'grass':
        color = Color(0xFF94c557);
        break;
      case 'ground':
        color = Color(0xFFd8bd6b);
        break;
      case 'ice':
        color = Color(0xFFabd8d5);
        break;
      case 'normal':
        color = Color(0xFFa7a67b);
        break;
      case 'poison':
        color = Color(0xFF8e419d);
        break;
      case 'psychic':
        color = Color(0xFFd95584);
        break;
      case 'rock':
        color = Color(0xFFafa041);
        break;
      case 'steel':
        color = Color(0xFFb5b5cc);
        break;
      case 'water':
        color = Color(0xFF728eed);
        break;
      default:
        color = Color(0xFFb5b5cc);
    }
    return color;
  }
}
