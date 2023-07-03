import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Drawer(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey.shade400,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tanmay Kumar",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade800),
                          ),
                          Text(
                            "32 Stars",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              width: 25,
                              height: 25,
                              child: Icon(FontAwesomeIcons.house,color: Colors.grey.shade700,)),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "My Feed",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: 25,
                              height: 25,
                              child: Icon(FontAwesomeIcons.solidFileCode,color: Colors.grey.shade700,)),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "My Projects",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: 25,
                              height: 25,
                              child: Icon(FontAwesomeIcons.plus,color: Colors.grey.shade700,)),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Create Projects",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: 25,
                              height: 25,
                              child: Icon(FontAwesomeIcons.idCard,color: Colors.grey.shade700,)),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "My Profile",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: 25,
                              height: 25,
                              child: Icon(FontAwesomeIcons.solidBookmark,color: Colors.grey.shade700,)),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Saved Projects",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox()),
                MaterialButton(
                  onPressed: () {},
                  minWidth: width,
                  height: 50,
                  elevation: 15,
                  color: const Color(0xfffc6b68),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: const Text(
                    "Log Out",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}