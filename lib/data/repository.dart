import 'dart:convert';

import 'package:superhero_app/models/superheroresponse.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<Superheroresponse?> fetchSuperhero(String name) async {
    final response = await http.get(
      Uri.parse(
        'https://superheroapi.com/api/dc6a676fdf35321247f50aa132b9d4d3/search/$name',
      ),
    );

    if (response.statusCode == 200) {
      var decodedjson = jsonDecode(response.body);
      Superheroresponse superhero = Superheroresponse.fromJson(decodedjson);
      return superhero;
    } else {
      return null;
    }
  }
}
