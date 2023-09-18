import 'package:app/app/models/user.dart';
import 'package:app/app/services/user_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserRepository extends ChangeNotifier {
  User _user = User(
    id: null,
    nickName: '',
    email: null,
    createdAt: null,
    updatedAt: null,
    token: null,
  );

  Future<void> getUser() async {
    final u = await UserLocal().user;

    if (u[0].nickName != '' && u[0].nickName.isNotEmpty) _user = u[0];

    notifyListeners();
  }

  User get user => _user;

  bool get isLogged => _user.nickName != '';

  Future<void> create(User u) async {
    _user = u;
    await UserLocal().create(u);

    notifyListeners();
  }
}

final userProvider = ChangeNotifierProvider<UserRepository>((ref) {
  return UserRepository();
});
