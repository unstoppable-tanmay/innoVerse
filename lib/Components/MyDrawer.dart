import 'dart:math';

import 'package:flutter/material.dart';
import 'package:innoverse/Screens/AddProject.dart';
import 'package:innoverse/Screens/Favourites.dart';
import 'package:innoverse/Screens/MyProjects.dart';
import 'package:slide_drawer/slide_drawer.dart';

import '../Screens/Profile.dart';
import '../main.dart';
import 'Appbar.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    super.key,
    required this.width,
    required this.title,
    required this.Page,
  });

  final String title;
  final double width;
  final Widget Page;

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return SlideDrawer(
      curve: Curves.decelerate,
      items: [
        MenuItem('Home', icon: Icons.home, onTap: () {}),
        MenuItem('My Projects', icon: Icons.file_open, onTap: () {
          navKey.currentState!.push(MaterialPageRoute(
            builder: (context) => const MyProjects(),
          ));}),
        MenuItem('Add Project', icon: Icons.add, onTap: () {
          navKey.currentState!.push(MaterialPageRoute(
            builder: (context) => const AddProject(),
          ));
        }),
        MenuItem('My Profile', icon: Icons.person_2_rounded, onTap: () {
          navKey.currentState!.push(MaterialPageRoute(
            builder: (context) => const Profile(),
          ));
        }),
        MenuItem('Favourites', icon: Icons.favorite_rounded, onTap: () {
          navKey.currentState!.push(MaterialPageRoute(
            builder: (context) => const Favorites(),
          ));}),
      ],
      offsetFromRight: widget.width * .4,
      rotateAngle: pi / 5,
      brightness: Brightness.dark,
      backgroundColor: Colors.grey.shade400,
      child: Scaffold(
        appBar: Appbar(
          title: widget.title,
          appBar: AppBar(),
          action: true,
        ),
        backgroundColor: const Color(0xfff1f5f7),
        body: widget.Page,
      ),
    );
  }
}
