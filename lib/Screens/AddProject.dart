import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:innoverse/Services/Data.dart';
import 'package:uuid/uuid.dart';

class AddProject extends StatefulWidget {
  const AddProject({super.key});

  @override
  State<AddProject> createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  File? imagepath;

  final _firebaseStorage = FirebaseStorage.instance;

  final TextEditingController name = TextEditingController();
  final TextEditingController link = TextEditingController();
  final TextEditingController lang = TextEditingController();
  final TextEditingController desc = TextEditingController();
  final TextEditingController brief = TextEditingController();
  String type = '';
  String imgUrl = '';

  PickImage() async {
    ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagepath = File(image!.path);
    });
  }

  createProject() async {
    var uuid = const Uuid();
    var uid = uuid.v1();
    if (imagepath != null &&
        name.text.isNotEmpty &&
        link.text.isNotEmpty &&
        lang.text.isNotEmpty &&
        type.isNotEmpty &&
        desc.text.isNotEmpty &&
        brief.text.isNotEmpty) {
      var snapshot = _firebaseStorage
          .ref()
          .child('images/$uid')
          .putFile(imagepath!)
          .snapshot;
      imgUrl = await snapshot.ref.getDownloadURL();
      FirebaseFirestore.instance.collection('projects').doc(uid).set({
        'name': name.text,
        'link': link.text,
        'image': imgUrl,
        'lang': lang,
        'time': Timestamp.fromDate(DateTime.now()),
        'type': type,
        'id': uid,
        'star': 0,
        'uid': userData!.uid,
        'desc': desc.text,
        'brief': brief.text
      });
    } else {
      print("fill");
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xfff1f5f7),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  imagepath != null
                      ? Container(
                          width: 120,
                          height: 170,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.white),
                          child: Image.file(
                            File(imagepath!.path),
                            fit: BoxFit.fill,
                          ))
                      : const SizedBox(),
                  InkWell(
                      onTap: () {
                        PickImage();
                      },
                      child: Container(
                        width: 120,
                        height: 170,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.black26),
                        child: const Icon(CupertinoIcons.add, size: 40),
                      )),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(
                    left: 20, right: 10, top: 5, bottom: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: TextField(
                  controller: name,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(fontSize: 17),
                    hintText: 'Enter Your Project Name',
                    suffixIcon: Icon(CupertinoIcons.folder),
                    border: InputBorder.none,
                    // contentPadding: EdgeInsets.all(20),
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
                child: TextField(
                  controller: link,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(fontSize: 17),
                    hintText: 'Enter Your Project Link',
                    suffixIcon: Icon(CupertinoIcons.link),
                    border: InputBorder.none,
                    // contentPadding: EdgeInsets.all(20),
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
                child: TextField(
                  controller: lang,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(fontSize: 17),
                    hintText: 'Enter Project Language',
                    suffixIcon:
                        Icon(CupertinoIcons.chevron_left_slash_chevron_right),
                    border: InputBorder.none,
                    // contentPadding: EdgeInsets.all(20),
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
                      DropdownMenuItem(child: Text("App"), value: "App"),
                      DropdownMenuItem(child: Text("Web"), value: "Web"),
                      DropdownMenuItem(
                        child: Text("Backend"),
                        value: "Backend",
                      ),
                      DropdownMenuItem(
                        child: Text("Other"),
                        value: "Other",
                      )
                    ],
                    isExpanded: true,
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(fontSize: 17),
                      hintText: 'Enter Project Type',
                      border: InputBorder.none,
                    ),
                    onChanged: (ele) {
                      type = ele ?? "";
                    }),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(
                    left: 20, right: 10, top: 5, bottom: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: TextField(
                  controller: desc,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  maxLength: 50,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(fontSize: 17),
                    hintText: 'Enter Your Short Description',
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
                child: TextField(
                  controller: brief,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  maxLines: 10,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(fontSize: 17),
                    hintText: 'Enter Your Project Briefly',
                    border: InputBorder.none,
                    // contentPadding: EdgeInsets.all(20),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () => createProject(),
                minWidth: width,
                height: 50,
                elevation: 15,
                color: const Color(0xfffc6b68),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: const Text(
                  "Create",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
