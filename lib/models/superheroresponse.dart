import 'package:superhero_app/models/superherodetailresponse.dart';

class Superheroresponse {
  final String response;
  final List<Superherodetailresponse> results;

  Superheroresponse({required this.response, required this.results});
  factory Superheroresponse.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<Superherodetailresponse> resultsList = list
        .map((hero) => Superherodetailresponse.fromJson(hero))
        .toList();

    return Superheroresponse(response: json['response'], results: resultsList);
  }
}
