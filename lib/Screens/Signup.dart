import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: const Color(0xfff6f5fc),
            padding: const EdgeInsets.all(30),
            width: width,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Welcome Sir!",
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Have a nice day\nwith us!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: TextField(
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(fontSize: 17),
                          hintText: 'Enter Your Name',
                          suffixIcon: Icon(CupertinoIcons.person_alt),
                          border: InputBorder.none,
                          // contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: TextField(
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(fontSize: 17),
                          hintText: 'Enter Your Email',
                          suffixIcon: Icon(CupertinoIcons.at),
                          border: InputBorder.none,
                          // contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: TextField(
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(fontSize: 17),
                          hintText: 'Enter Your Password',
                          suffixIcon: Icon(CupertinoIcons.eye),
                          border: InputBorder.none,
                          // contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: TextField(
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(fontSize: 17),
                          hintText: 'Enter Your TagLine',
                          suffixIcon: Icon(CupertinoIcons.captions_bubble_fill),
                          border: InputBorder.none,
                          // contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: TextField(
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(fontSize: 17),
                          hintText: 'Enter Your Position',
                          suffixIcon: Icon(CupertinoIcons.device_laptop),
                          border: InputBorder.none,
                          // contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Add Social Accounts",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          FontAwesomeIcons.github,
                          size: 30,
                          color: Colors.grey.shade700,
                        ),
                        Icon(
                          FontAwesomeIcons.linkedin,
                          size: 30,
                          color: Colors.grey.shade700,
                        ),
                        Icon(
                          FontAwesomeIcons.instagram,
                          size: 30,
                          color: Colors.grey.shade700,
                        )
                      ],
                    ),
                  ],
                ),
                MaterialButton(
                  onPressed: () {},
                  minWidth: width,
                  height: 50,
                  color: const Color(0xfffc6b68),
                  elevation: 15,
                  enableFeedback: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
