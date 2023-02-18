import 'dart:convert';

Regencies regenciesFromJson(String str) => Regencies.fromJson(json.decode(str));

String regenciesToJson(Regencies data) => json.encode(data.toJson());

class Regencies {
  Regencies({
    required this.id,
    required this.provinceId,
    required this.name,
  });

  String id;
  String provinceId;
  String name;

  factory Regencies.fromJson(Map<String, dynamic> json) => Regencies(
        id: json["id"],
        provinceId: json["province_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "province_id": provinceId,
        "name": name,
      };
}
