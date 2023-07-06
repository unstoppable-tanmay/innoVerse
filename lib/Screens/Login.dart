import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:innoverse/Components/HiddenDrawer.dart';

import '../Services/Data.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  UserCredential? user;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(context) async {
    try {
      user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      await getUser(user!.user!.uid);
      print(userData!.name);
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return HiddenDrawer();
        },
      ));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
              width: width,
              height: height,
              color: const Color(0xfff6f5fc),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Hello Again!",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Welcome back you've\nbeen missed!",
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
                          controller: emailController,
                          onTapOutside: (event) {
                            FocusScope.of(context).unfocus();
                          },
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(fontSize: 17),
                            hintText: 'Enter Your Username',
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
                          controller: passwordController,
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
                      const Align(
                          heightFactor: 3,
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Recover Password",
                            style: TextStyle(fontSize: 15),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      MaterialButton(
                        onPressed: () => login(context),
                        minWidth: width,
                        height: 50,
                        elevation: 15,
                        color: const Color(0xfffc6b68),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: width * .2,
                        height: 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [Colors.transparent, Colors.black])),
                      ),
                      const Text("Or continue with"),
                      Container(
                        width: width * .2,
                        height: 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(colors: [
                              Colors.black,
                              Colors.transparent,
                            ])),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {},
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                                width: 2, color: Colors.white)),
                        child: const Icon(CupertinoIcons.add),
                      ),
                      const SizedBox(
                        width: 35,
                      ),
                      MaterialButton(
                        onPressed: () {},
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                                width: 2, color: Colors.white)),
                        child: const Icon(CupertinoIcons.add),
                      ),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Not a member?',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Resister now',
                              style: const TextStyle(
                                  color: Colors.blueAccent, fontSize: 13),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // navigate to desired screen
                                })
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
