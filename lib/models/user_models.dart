import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.id,
    this.glass,
    this.paper,
    this.iron,
    this.lightbulb,
    this.bottle,
  });

  int? id;
  String? glass;
  String? paper;
  String? iron;
  String? lightbulb;
  String? bottle;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        glass: json["glass"],
        paper: json["paper"],
        iron: json["iron"],
        lightbulb: json["lightbulb"],
        bottle: json["bottle"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "glass": glass,
        "paper": paper,
        "iron": iron,
        "lightbulb": lightbulb,
        "bottle": bottle,
      };
}
