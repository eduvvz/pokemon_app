import 'dart:convert';
import 'package:http/http.dart';
import 'package:pokemon/service/pokemon.dart';

class HttpService {
  final String baseURL = "https://pokeapi.co/api/v2/";

  Future<List<Pokemon>> getPokemons({limit = 30, offset = 0}) async {
    print('$baseURL/pokemon?limit=$limit&offset=$offset');
    var res = await get('$baseURL/pokemon?limit=$limit&offset=$offset');

    if (res.statusCode == 200) {
      var jsonDecoded = json.decode(res.body)["results"];

      return List<Pokemon>.from(
        jsonDecoded.map((x) => Pokemon.fromJson(x)),
      );
    } else {
      throw "Can't get pokemons.";
    }
  }
}
