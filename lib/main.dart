import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:innoverse/Components/HiddenDrawer.dart';
import 'package:innoverse/Screens/OnBoarding.dart';

import 'Services/Data.dart';
import 'firebase_options.dart';

bool logined = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (FirebaseAuth.instance.currentUser != null) {
    await getUser(FirebaseAuth.instance.currentUser!.uid);
    if (userData != null) {
      await getMyProjects(userData!.uid);
      await getSavedProjects();
      await getProjectsChunk();
      logined = true;
    }
  } else {
    logined = false;
  }

  runApp(const MyApp());
}

final navKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navKey,
        debugShowCheckedModeBanner: false,
        color: const Color(0xfff1f5f7),
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: logined ? const HiddenDrawer() : const OnBoarding());
  }
}
