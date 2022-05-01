import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tempgen/data/data.dart';

class FirebaseHelper {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void addTemplate(String name) async {
    sectionList['name'] = name;
    await _db.collection('templates').add(sectionList);
  }
}
