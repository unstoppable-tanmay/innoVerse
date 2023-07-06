import 'package:flutter/material.dart';
import 'package:innoverse/Services/Data.dart';
import '../Components/Feed.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xfff1f5f7),
      body: Feed(data: savedProjectsData),
    );
  }
}
