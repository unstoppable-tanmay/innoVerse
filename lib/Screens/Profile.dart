import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:innoverse/Screens/OnBoarding.dart';
import 'package:innoverse/Services/Data.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color(0xfff1f5f7),
        body: Container(
          width: width,
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    padding: const EdgeInsets.only(bottom: 20),
                    width: width * .85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: width * .85,
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                  padding:
                                      const EdgeInsets.only(bottom: 8, left: 8),
                                  width: 35,
                                  height: 35,
                                  decoration: const BoxDecoration(
                                      color: Colors.black45,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(50))),
                                  child: const Icon(
                                    FontAwesomeIcons.paintbrush,
                                    size: 15,
                                    color: Colors.white,
                                  ))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          userData!.name,
                          style: const TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          userData!.email,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: width * .435 - 40,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(userData!.gender == "male"
                          ? "assets/profile/male.jpg"
                          : "assets/profile/female.jpg"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                width: width * .85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const Text(
                      "About",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "\"${userData!.tagline}\"",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Now As ${userData!.position}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.github,
                          color: userData!.accounts.containsKey('github')
                              ? Colors.black87
                              : Colors.grey.shade800,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          FontAwesomeIcons.linkedin,
                          color: userData!.accounts.containsKey('linkedin')
                              ? Colors.black87
                              : Colors.grey.shade800,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          FontAwesomeIcons.instagram,
                          color: userData!.accounts.containsKey('instagram')
                              ? Colors.black87
                              : Colors.grey.shade800,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                minWidth: width * .85,
                padding: const EdgeInsets.all(15),
                onPressed: () {},
                child: const Text(
                  "My Projects",
                  style: TextStyle(fontSize: 18),
                ),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                minWidth: width * .85,
                padding: const EdgeInsets.all(15),
                onPressed: () {},
                child: const Text(
                  "Saved Projects",
                  style: TextStyle(fontSize: 18),
                ),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              const Expanded(child: SizedBox()),
              MaterialButton(
                minWidth: width * .85,
                padding: const EdgeInsets.all(15),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  projectsData = [];
                  myProjectsData = [];
                  savedProjectsData = [];
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return OnBoarding();
                    },
                  ), (route) => false);
                },
                child: const Text(
                  "Log Out",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                color: const Color(0xfffc6b68),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ));
  }
}
