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
    var color = Colors.green;
    switch (name) {
      case 'bug':
        color = Colors.blue;
        break;
      default:
    }
    return color;
  }
}
