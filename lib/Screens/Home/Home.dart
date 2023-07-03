import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slide_drawer/slide_drawer.dart';

import '../../Components/DrawerWidget.dart';
import 'Feed.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Feed",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xfff1f5f7),
        surfaceTintColor: const Color(0xfff1f5f7),
        elevation: 10,
        actions: [
          Builder(
              builder: (context) => InkWell(
                  onTap: () {
                    SlideDrawer.of(context)?.toggle();
                  },
                  child: const Icon(FontAwesomeIcons.barsStaggered))),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      backgroundColor: const Color(0xfff1f5f7),
      // floatingActionButton: FloatingActionButton(
      //   enableFeedback: true,
      //   backgroundColor: const Color(0xfffc6b68),
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      //   onPressed: () {},
      //   child: const Icon(
      //     FontAwesomeIcons.plus,
      //     color: Colors.white,
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: const Feed(),
    );
  }
}
