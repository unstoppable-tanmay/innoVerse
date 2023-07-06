import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:innoverse/Components/HiddenDrawer.dart';
import 'package:innoverse/Services/Data.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController taglineController = TextEditingController();
  TextEditingController positionController = TextEditingController();

  TextEditingController githubController = TextEditingController();
  TextEditingController linkedinController = TextEditingController();
  TextEditingController instaController = TextEditingController();

  String gender = "";

  _signup(context) async {
    try {
      var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      userData = UserData(
          gender: gender,
          name: nameController.text,
          email: emailController.text,
          position: positionController.text,
          tagline: taglineController.text,
          saved: [],
          uid: user.user!.uid,
          accounts: {
            'github': githubController.text,
            'linkedin': linkedinController.text,
            'instagram': instaController.text,
          });

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.user!.uid)
          .set({
        'name': nameController.text,
        'email': emailController.text,
        'tagline': taglineController.text,
        'position': positionController.text,
        'gender': gender,
        'saved': [],
        'uid': user.user!.uid,
        'accounts': {
          'github': githubController.text,
          'linkedin': linkedinController.text,
          'instagram': instaController.text,
        }
      });

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return const HiddenDrawer();
        },
      ), (route) => false);
    } catch (e) {}
  }

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
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
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
                        controller: nameController,
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(fontSize: 17),
                          hintText: 'Enter Your Name',
                          suffixIcon: Icon(CupertinoIcons.person_alt),
                          border: InputBorder.none,
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
                        controller: emailController,
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(fontSize: 17),
                          hintText: 'Enter Your Email',
                          suffixIcon: Icon(CupertinoIcons.at),
                          border: InputBorder.none,
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
                        controller: passwordController,
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(fontSize: 17),
                          hintText: 'Enter Your Password',
                          suffixIcon: Icon(CupertinoIcons.eye),
                          border: InputBorder.none,
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
                        controller: taglineController,
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(fontSize: 17),
                          hintText: 'Enter Your TagLine',
                          suffixIcon: Icon(CupertinoIcons.captions_bubble_fill),
                          border: InputBorder.none,
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
                        controller: positionController,
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(fontSize: 17),
                          hintText: 'Enter Your Position',
                          suffixIcon: Icon(CupertinoIcons.device_laptop),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: DropdownButtonFormField(
                          items: const [
                            DropdownMenuItem(
                                value: "male", child: Text("Male")),
                            DropdownMenuItem(
                                value: "female", child: Text("Female")),
                          ],
                          isExpanded: true,
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(fontSize: 17),
                            hintText: 'Enter Gender',
                            border: InputBorder.none,
                          ),
                          onChanged: (ele) {
                            setState(() {
                              gender = ele ?? "male";
                            });
                          }),
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
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Container(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 10, top: 5, bottom: 0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: TextField(
                                      controller: githubController,
                                      onTapOutside: (event) {
                                        FocusScope.of(context).unfocus();
                                      },
                                      decoration: const InputDecoration(
                                        hintStyle: TextStyle(fontSize: 17),
                                        hintText: 'Enter Github Link',
                                        suffixIcon: Icon(CupertinoIcons.link),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    MaterialButton(
                                      onPressed: () {},
                                      // minWidth: width*.5,
                                      height: 50,
                                      color: const Color(0xfffc6b68),
                                      elevation: 15,
                                      enableFeedback: true,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: const Text(
                                        "Done",
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.white),
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(
                            FontAwesomeIcons.github,
                            size: 30,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Container(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 10, top: 5, bottom: 0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: TextField(
                                      controller: linkedinController,
                                      onTapOutside: (event) {
                                        FocusScope.of(context).unfocus();
                                      },
                                      decoration: const InputDecoration(
                                        hintStyle: TextStyle(fontSize: 17),
                                        hintText: 'Enter LinkedIn Link',
                                        suffixIcon: Icon(CupertinoIcons.link),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    MaterialButton(
                                      onPressed: () {},
                                      // minWidth: width*.5,
                                      height: 50,
                                      color: const Color(0xfffc6b68),
                                      elevation: 15,
                                      enableFeedback: true,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: const Text(
                                        "Done",
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.white),
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(
                            FontAwesomeIcons.linkedin,
                            size: 30,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Container(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 10, top: 5, bottom: 0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: TextField(
                                      controller: instaController,
                                      onTapOutside: (event) {
                                        FocusScope.of(context).unfocus();
                                      },
                                      decoration: const InputDecoration(
                                        hintStyle: TextStyle(fontSize: 17),
                                        hintText: 'Enter Instagram Link',
                                        suffixIcon: Icon(CupertinoIcons.link),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    MaterialButton(
                                      onPressed: () {},
                                      // minWidth: width*.5,
                                      height: 50,
                                      color: const Color(0xfffc6b68),
                                      elevation: 15,
                                      enableFeedback: true,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: const Text(
                                        "Done",
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.white),
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(
                            FontAwesomeIcons.instagram,
                            size: 30,
                            color: Colors.grey.shade700,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                MaterialButton(
                  onPressed: () {
                    _signup(context);
                  },
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
