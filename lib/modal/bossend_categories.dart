// To parse this JSON data, do
//
//     final bossendCategories = bossendCategoriesFromJson(jsonString);

import 'dart:convert';

BossendCategories bossendCategoriesFromJson(String str) => BossendCategories.fromJson(json.decode(str));

String bossendCategoriesToJson(BossendCategories data) => json.encode(data.toJson());

class BossendCategories {
  bool success;
  List<Datum> data;
  String message;
  int status;

  BossendCategories({
    required this.success,
    required this.data,
    required this.message,
    required this.status,
  });

  factory BossendCategories.fromJson(Map<String, dynamic> json) => BossendCategories(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
    "status": status,
  };
}

class Datum {
  int id;
  String name;
  dynamic description;
  dynamic parentId;

  Datum({
    required this.id,
    required this.name,
    required this.description,
    required this.parentId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    parentId: json["parent_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "parent_id": parentId,
  };
}
