class Superherodetailresponse {
  final String name;
  final String? fullname;
  final String id;
  final String? url;
  final SuperheroStats? powerstats;

  Superherodetailresponse({
    required this.name,
    required this.id,
    this.url = '',
    this.powerstats,
    this.fullname = '',
  });

  factory Superherodetailresponse.fromJson(Map<String, dynamic> json) {
    return Superherodetailresponse(
      name: json['name'],
      id: json['id'],
      url: json['image']['url'],
      powerstats: json['powerstats'] != null
          ? SuperheroStats.fromJson(json['powerstats'])
          : null,
      fullname: json['biography']['full-name'],
    );
  }
}

class SuperheroStats {
  final String intelligence;
  final String strength;
  final String speed;
  final String durability;
  final String power;
  final String combat;

  SuperheroStats({
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
  });

  factory SuperheroStats.fromJson(Map<String, dynamic> json) {
    return SuperheroStats(
      intelligence: json['intelligence'],
      strength: json['strength'],
      speed: json['speed'],
      durability: json['durability'],
      power: json['power'],
      combat: json['combat'],
    );
  }
}
