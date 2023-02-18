import 'dart:convert';

Provinces provincesFromJson(String str) => Provinces.fromJson(json.decode(str));

String provincesToJson(Provinces data) => json.encode(data.toJson());

class Provinces {
  Provinces({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Provinces.fromJson(Map<String, dynamic> json) => Provinces(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
