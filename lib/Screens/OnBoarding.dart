import 'package:flutter/material.dart';
import 'package:innoverse/Screens/Login.dart';

import 'Signup.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  bool login = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/onboarding_background.jpeg"),
                fit: BoxFit.cover)),
        child: Container(
          padding:
              const EdgeInsets.only(top: 10, bottom: 35, right: 10, left: 10),
          decoration: BoxDecoration(
            color: Colors.white60,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  clipBehavior: Clip.hardEdge,
                  height: height * .55,
                  width: width,
                  child: Image.asset(
                    "assets/images/boy_laptop_dark.png",
                    fit: BoxFit.cover,
                    scale: 1.5,
                  )),
              Column(
                children: [
                  const Text(
                    "Showcase Your\nProjects & Ideas Here",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  Text(
                    "You can add your projects with all its\ndetails and other people can visit & star.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade700),
                  ),
                ],
              ),
              Container(
                width: width * .7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white30),
                child: Stack(
                  children: [
                    AnimatedContainer(
                      margin: EdgeInsets.only(
                          left: login == true ? width * .35 : 0),
                      // transform: login==true ? Matrix4.translationValues(width * .35, 0, 0) : Matrix4.translationValues(0, 0, 0),
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOutCirc,
                      width: width * .35,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () async {
                            setState(() {
                              login = false;
                            });
                            await Future.delayed(
                                const Duration(milliseconds: 200));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Signup()));
                          },
                          child: Container(
                            width: width * .35,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                                child: Text(
                              "Register",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blueGrey.shade700),
                            )),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            setState(() {
                              login = true;
                            });
                            await Future.delayed(
                                const Duration(milliseconds: 200));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()));
                          },
                          child: Container(
                            width: width * .35,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                                child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blueGrey.shade700),
                            )),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
