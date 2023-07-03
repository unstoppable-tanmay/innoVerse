class ProjectData {
  final String name;
  final String id;
  final String uid;
  final String desc;
  final String brief;
  final String image;
  final List<String> lang;
  final String link;
  final String star;
  final String type;
  final DateTime time;

  ProjectData({required this.name, required this.id, required this.uid, required this.desc, required this.brief, required this.image,
      required this.lang, required this.link, required this.star, required this.type, required this.time});
}

class UserData {
  final String name;
  final String email;
  final String position;
  final String tagline;
  final List<String> saved;
  final String uid;
  final Map<dynamic, String> accounts;

  UserData(this.name, this.email, this.position, this.tagline, this.saved,
      this.uid, this.accounts);
}

getMyPrjects(uid) {}

getSavedProjects() {}

getProjectsChunk() {}

getUser(uid) {}
