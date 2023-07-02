import 'package:flutter/material.dart';
import 'package:innoverse/Screens/Login.dart';

import 'package:innoverse/Screens/Home.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:innoverse/Screens/OnBoarding.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {'/': (context) => const OnBoarding()},
    );
  }
}
