import 'package:flutter/material.dart';
import 'package:innoverse/Services/Data.dart';
import '../Components/Feed.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({super.key});

  @override
  State<MyProjects> createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xfff1f5f7),
      body: Feed(data: myProjectsData),
    );
  }
}
