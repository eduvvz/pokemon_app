import 'package:flutter/foundation.dart';

class Pokemon {
  final String url;
  final String name;

  Pokemon({
    @required this.url,
    @required this.name,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => new Pokemon(
        name: json["name"],
        url: json["url"],
      );
}
