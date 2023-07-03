import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:innoverse/Services/Data.dart';

import 'Star.dart';

class StaggeredCard extends StatelessWidget {
  const StaggeredCard(
      {super.key, required this.project, required this.cardwidth});

  final ProjectData project;
  final double cardwidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: Stack(
        children: [
          Container(
            constraints: const BoxConstraints(minHeight: 180,maxHeight: 350),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            clipBehavior: Clip.hardEdge,
            child: Image.network(
              project.image,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(FontAwesomeIcons.info);
              },
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: cardwidth * .44,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black87],
                  )),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "BookHive",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: cardwidth * .38,
                        child: const Text(
                          "A Library Management App with Flutter and make a goof app and he is a good boy",
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  // const Icon(FontAwesomeIcons.solidBookmark,color: Colors.white60,)
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Stack(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          topRight: Radius.circular(8))),
                ),
                Positioned(top: 7, right: 7, child: Star()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
