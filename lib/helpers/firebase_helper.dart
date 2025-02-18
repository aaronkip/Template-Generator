import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tempgen/data/data.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class FirebaseHelper {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? uid;
  String? userEmail;
  String? userRole;

  void addTemplate(String name, userId) async {
    sectionList['name'] = name;
    sectionList['uid'] = userId;
    await _db.collection('templates').add(sectionList);
  }

  void saveEditedTemplate(String name, userId) async {
    selectedList['name'] = name;
    selectedList['uid'] = userId;
    await _db.collection('templates').add(selectedList);
  }

  void deleteTemplate(String docId) async {
    await _db.collection('templates').doc(docId).delete();
  }

  Future<User?> registerWithEmailPassword(
      String email, String password, String role, BuildContext context) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    User? user;
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;

      if (user != null) {
        uid = user.uid;
        userEmail = user.email;
        await _db
            .collection('users')
            .add({"userRole": role, "uid": uid, "email": userEmail});
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showTopSnackBar(
            context, const Text('The password provided is too weak.'));
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showTopSnackBar(
            context, const Text('An account already exists for that email.'));
        print('An account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    return user;
  }

  Future<User?> signInWithEmailPassword(String email, String password) async {
    User? user;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      if (user != null) {
        uid = user.uid;
        userEmail = user.email;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("email", email);
        await prefs.setBool('auth', true);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }
    return user;
  }

  Future<String> signOut() async {
    await _auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('auth', false);

    uid = null;
    userEmail = null;

    return 'User signed out';
  }

  Future getUser() async {
    // Initialize Firebase
    //await Firebase.initializeApp();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool authSignedIn = prefs.getBool('auth') ?? false;

    final User? user = _auth.currentUser;

    if (authSignedIn == true) {
      if (user != null) {
        uid = user.uid;
        //name = user.displayName;
        userEmail = user.email;
        //imageUrl = user.photoURL;
      }
    }
  }
}
