import 'package:app/app/repositories/users.dart';
import 'package:app/app/screens/dashboard_screen.dart';
import 'package:app/app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthOrHomePage extends ConsumerWidget {
  const AuthOrHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.read(userProvider).getUser(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.error != null) {
          print(snapshot.error);
          return const Center(
            child: Text('Ocorreu um erro!'),
          );
        } else {
          return ref.watch(userProvider).isLogged
              ? const DashboardScreen()
              : const SplashScreen();
        }
      },
    );
  }
}
