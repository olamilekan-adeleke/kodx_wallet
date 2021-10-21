import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'cores/utils/locator.dart';
import 'features/auth/views/pages/wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (_, __, ___) {
        return MaterialApp(
          title: 'Kodx Wallet',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const WrapperScreen(),
        );
      },
    );
  }
}
