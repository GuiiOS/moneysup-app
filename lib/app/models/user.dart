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

  User copyWith({
    int? id,
    String? nickName,
    String? email,
    String? createdAt,
    String? updatedAt,
    String? token,
  }) {
    return User(
      id: id ?? this.id,
      nickName: nickName ?? this.nickName,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      token: token ?? this.token,
    );
  }
}
