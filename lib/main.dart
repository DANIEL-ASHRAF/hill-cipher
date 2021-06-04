import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hill_cipher_app/hill_cipher_view.dart';

import 'helper/constants/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hill cipher app',
      theme: normalMode,
      home: HillCipherView(),
    );
  }
}
