import 'package:app/app/models/user.dart';
import 'package:app/app/moneysup_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  final dir = await path.getApplicationDocumentsDirectory();

  Hive.init(dir.path);
  Hive.initFlutter();

  Hive.registerAdapter<User>(UserAdapter());

  await Hive.openBox<User>('user_db');

  runApp(const ProviderScope(child: MoneysupApp()));
}
