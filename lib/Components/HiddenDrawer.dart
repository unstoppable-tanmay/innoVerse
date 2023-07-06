import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:innoverse/Screens/AddProject.dart';
import 'package:innoverse/Screens/Favourites.dart';
import 'package:innoverse/Screens/Home.dart';
import 'package:innoverse/Screens/MyProjects.dart';
import 'package:innoverse/Screens/Profile.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  TextStyle base =
      const TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: Colors.white);
  TextStyle selected = TextStyle(
      fontSize: 21, fontWeight: FontWeight.w500, color: Colors.grey.shade700);

  @override
  void initState() {
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Home",
              selected: true,
              baseStyle: base,
              selectedStyle: selected,
              colorLineSelected: Colors.white),
          const Home()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "My Projects",
              selected: true,
              baseStyle: base,
              selectedStyle: selected,
              colorLineSelected: Colors.white),
          const MyProjects()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Create Project",
              selected: true,
              baseStyle: base,
              selectedStyle: selected,
              colorLineSelected: Colors.white),
          const AddProject()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Profile",
              selected: true,
              baseStyle: base,
              selectedStyle: selected,
              colorLineSelected: Colors.white),
          const Profile()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Favorites",
              selected: true,
              baseStyle: base,
              selectedStyle: selected,
              colorLineSelected: Colors.white),
          const Favorites()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.grey.shade400,
      screens: _pages,
      initPositionSelected: 0,
      contentCornerRadius: 20,
      isTitleCentered: true,
      enableCornerAnimation: true,
      slidePercent: 60,
      backgroundColorAppBar: Colors.white,
      backgroundColorContent: const Color(0xfff1f5f7),
      leadingAppBar: const Icon(FontAwesomeIcons.barsStaggered, size: 20),
    );
  }
}
