import 'dart:convert';

Districts districtsFromJson(String str) => Districts.fromJson(json.decode(str));

String districtsToJson(Districts data) => json.encode(data.toJson());

class Districts {
  Districts({
    required this.id,
    required this.regencyId,
    required this.name,
  });

  String id;
  String regencyId;
  String name;

  factory Districts.fromJson(Map<String, dynamic> json) => Districts(
        id: json["id"],
        regencyId: json["regency_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "regency_id": regencyId,
        "name": name,
      };
}
