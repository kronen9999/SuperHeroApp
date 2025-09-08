class Superheroresponse {
  final String response;

  Superheroresponse({required this.response});
  factory Superheroresponse.fromJson(Map<String, dynamic> json) {
    return Superheroresponse(response: json['response']);
  }
}
