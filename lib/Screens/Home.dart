import 'package:flutter/material.dart';
import 'package:innoverse/Services/Data.dart';
import '../Components/Feed.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f5f7),
      body: Feed(
          data: projectsData!
              .where((element) => element.uid != userData!.uid)
              .toList()),
    );
  }
}
