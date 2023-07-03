import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:innoverse/Screens/Profile.dart';
import 'package:slide_drawer/slide_drawer.dart';
import 'firebase_options.dart';

import 'package:innoverse/Screens/Login.dart';
import 'package:innoverse/Screens/OnBoarding.dart';
import 'Screens/Home/Home.dart';

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
    var width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SlideDrawer(
              curve: Curves.decelerate,
              items: [
                MenuItem('Home', icon: Icons.home, onTap: () {}),
                MenuItem('My Project', icon: Icons.rss_feed, onTap: () {}),
                MenuItem('Favourite',
                    icon: Icons.favorite_border, onTap: () {}),
                MenuItem('Profile', icon: Icons.person_outline, onTap: () {}),
                MenuItem('Setting', icon: Icons.settings, onTap: () {}),
              ],
              // isRotate: false,
              offsetFromRight: width * .4,
              rotateAngle: pi / 4,
              brightness: Brightness.dark,
              backgroundColor: Colors.grey.shade400,
              child: const Home(),
            ),
      },
    );
  }
}
