import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tempgen/data/data.dart';

class FirebaseHelper {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void addTemplate(String name) async {
    for (var i in sectionList) {
      await _db.collection("templates").doc(name).collection("data").add(i);
    }
  }
}
