import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectData {
  final String name;
  final String id;
  final String uid;
  final String desc;
  final String brief;
  final String image;
  final String lang;
  final String link;
  final String star;
  final String type;
  final DateTime time;

  ProjectData(
      {required this.name,
      required this.id,
      required this.uid,
      required this.desc,
      required this.brief,
      required this.image,
      required this.lang,
      required this.link,
      required this.star,
      required this.type,
      required this.time});
}

class UserData {
  final String name;
  final String email;
  final String position;
  final String tagline;
  final List<dynamic> saved;
  final String uid;
  final Map<String, dynamic> accounts;
  final String gender;

  UserData(
      {required this.gender,
      required this.name,
      required this.email,
      required this.position,
      required this.tagline,
      required this.saved,
      required this.uid,
      required this.accounts});
}

UserData? userData;
List<ProjectData>? projectsData;
QuerySnapshot<Map<String, dynamic>>? projects;
List<ProjectData>? myProjectsData;
List<ProjectData>? savedProjectsData;
bool firstproject = true;

getMyProjects(uid) async {
  // DateTime currentPhoneDate = DateTime.now();

  // Timestamp myTimeStamp = Timestamp.fromDate(currentPhoneDate);
  // print(myTimeStamp.toDate());

  var data = await FirebaseFirestore.instance
      .collection('projects')
      .where('uid', isEqualTo: uid)
      .get();
  for (var element in data.docs) {
    myProjectsData = [];
    ProjectData project = ProjectData(
        name: element.get('name'),
        id: element.get('id'),
        uid: uid,
        desc: element.get('desc'),
        brief: element.get('brief'),
        image: element.get('image'),
        lang: element.get('lang'),
        link: element.get('link'),
        star: element.get('star'),
        type: element.get('type'),
        time: DateTime.parse(element.get('time')));
    myProjectsData?.add(project);
  }
}

getSavedProjects() async {
  savedProjectsData = [];
  if (userData!.saved.isNotEmpty) {
    var data = await FirebaseFirestore.instance
        .collection('projects')
        .where('id', whereIn: userData!.saved)
        .get();
    for (var element in data.docs) {
      savedProjectsData = [];
      ProjectData project = ProjectData(
          name: element.get('name'),
          id: element.get('id'),
          uid: element.get('uid'),
          desc: element.get('desc'),
          brief: element.get('brief'),
          image: element.get('image'),
          lang: element.get('lang'),
          link: element.get('link'),
          star: element.get('star'),
          type: element.get('type'),
          time: DateTime.parse(element.get('time')));
      savedProjectsData?.add(project);
    }
  }
}

getProjectsChunk() async {
  if (firstproject) {
    projects = await FirebaseFirestore.instance
        .collection('projects')
        .orderBy('time')
        .limit(20)
        .get();
    firstproject = false;
  } else {
    projects = await FirebaseFirestore.instance
        .collection('projects')
        .orderBy('time')
        .startAfter(projects!.docs)
        .get();
  }
  for (var element in projects!.docs) {
    projectsData ??= [];
    ProjectData project = ProjectData(
        name: element.get('name'),
        id: element.get('id'),
        uid: element.get('uid'),
        desc: element.get('desc'),
        brief: element.get('brief'),
        image: element.get('image'),
        lang: element.get('lang'),
        link: element.get('link'),
        star: element.get('star'),
        type: element.get('type'),
        time: DateTime.parse(element.get('time')));
    projectsData?.add(project);
  }
}

getUser(uid) async {
  var user =
      await FirebaseFirestore.instance.collection('users').doc(uid).get();
  userData = UserData(
      name: user.data()!['name'] ?? "",
      email: user.data()!['email'] ?? "",
      gender: user.data()!['gender'] ?? "",
      position: user.data()!['position'] ?? "",
      tagline: user.data()!['tagline'] ?? "",
      saved: user.data()!['saved'] ?? [],
      uid: user.data()!['uid'] ?? "",
      accounts: user.data()!['accounts'] ?? {});
}
