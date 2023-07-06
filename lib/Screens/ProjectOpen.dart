import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:innoverse/Services/Data.dart';

class ProjectOpen extends StatefulWidget {
  const ProjectOpen({super.key, required this.project});

  final ProjectData project;

  @override
  State<ProjectOpen> createState() => _ProjectOpenState();
}

class _ProjectOpenState extends State<ProjectOpen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xfff1f5f7),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  constraints:
                      BoxConstraints(maxHeight: height * .7, minHeight: 200),
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 100,
                            offset: Offset(0, 10),
                            color: Colors.black38,
                            spreadRadius: 20)
                      ]),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Align(
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(20),
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white38),
                                  child: Hero(
                                    tag: widget.project.id,
                                    child: Image.network(
                                      widget.project.image,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 25,
                                    right: 25,
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.black54),
                                      child: Center(
                                        child: IconButton(
                                          icon: Icon(CupertinoIcons.xmark),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          color: Colors.white,
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Hero(
                      tag: widget.project.id,
                      child: Image.network(
                        widget.project.image,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(FontAwesomeIcons.info);
                        },
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black38,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          FontAwesomeIcons.solidStar,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          FontAwesomeIcons.link,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: width,
              color: Colors.transparent,
              child: Column(
                children: [
                  Text(
                    widget.project.name,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${widget.project.lang} - ${widget.project.type}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    widget.project.desc,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.project.brief,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
