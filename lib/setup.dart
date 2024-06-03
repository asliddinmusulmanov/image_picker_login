import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

import 'models/model.dart';

late Box box;

late String email;
late String password;

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter("flutter box");
  // Hive.registerAdapter(NoteAppAdapter());
  box = await Hive.openBox("user");
  // email = await Hive.openBox<String>("email");
}
