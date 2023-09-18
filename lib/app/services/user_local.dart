import 'dart:developer';

import 'package:app/app/models/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserLocal {
  final db = Hive.box<User>('user_db');

  void getUser() {
    user;
  }

  Future<List<User>> get user async {
    // Botei Future pq tava reclamando na tela do authOrNot.
    final dbUser = db.values.toList();
    return dbUser;
  }

  Future<void> create(User user) async {
    try {
      final dbUser = db.values.toList();

      if (dbUser.length > 1) {
        await db.clear();
      }

      await db.add(user);
    } catch (e) {
      log('deu ruim: $e');
    }
  }
}
