import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:innoverse/Components/StaggeredCard.dart';
import 'package:innoverse/Services/Data.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: MasonryGridView.builder(
            dragStartBehavior: DragStartBehavior.down,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            physics: const BouncingScrollPhysics(),
            itemCount: 11,
            itemBuilder: (context, index) {
              var cardwidth = MediaQuery.of(context).size.width;
              var height = ([250, 180, 300, 200, 350]..shuffle()).first;
              ProjectData project = ProjectData(
                  name: "BookHive",
                  id: "SSvUgkNzLI2GzzTEHA9y",
                  uid: "O0d6JNI2xacNmYmn6wnY0eP9CHJ3",
                  desc: 'A Flutter Project for Library management',
                  brief:
                      "this is a library management app where librarian can manage books admin can manage users student can request book extend time etc",
                  image: "https://picsum.photos/200/$height",
                  lang: ["Dart", "Json"],
                  link: "link.com",
                  star: "4",
                  type: "Application",
                  time: DateTime.now());
              return StaggeredCard(project: project, cardwidth: cardwidth);
            }));
  }
}
