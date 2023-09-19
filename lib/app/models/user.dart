import 'dart:convert';

import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String nickName;

  @HiveField(2)
  final String? email;

  @HiveField(3)
  final String? createdAt;

  @HiveField(4)
  final String? updatedAt;

  @HiveField(5)
  final String? token;

  User({
    required this.id,
    required this.nickName,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.token,
  });

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"] ? int.parse(json["id"]) : null,
        nickName: json["nickName"] ? json["nickName"] : '',
        email: json["email"] ? json["email"] : null,
        createdAt: json["createdAt"] ? json["createdAt"] : null,
        updatedAt: json["updatedAt"] ? json["updatedAt"] : null,
        token: json["token"] ? json["token"] : null,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nickName": nickName,
        "email": email,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "token": token,
      };
}
