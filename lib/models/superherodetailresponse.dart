class Superherodetailresponse {
  final String name;
  final String id;
  final String? url;

  Superherodetailresponse({
    required this.name,
    required this.id,
    this.url = '',
  });

  factory Superherodetailresponse.fromJson(Map<String, dynamic> json) {
    return Superherodetailresponse(
      name: json['name'],
      id: json['id'],
      url: json['image']['url'],
    );
  }
}
