class Superherodetailresponse {
  final String name;
  final String id;

  Superherodetailresponse({required this.name, required this.id});

  factory Superherodetailresponse.fromJson(Map<String, dynamic> json) {
    return Superherodetailresponse(name: json['name'], id: json['id']);
  }
}
