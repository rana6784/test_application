import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_application/verification.dart';

class DatabaseService {
  final _fire = FirebaseFirestore.instance;

  create(AppUser user) {
    try {
      _fire.collection('user').add(user.toMap());
    } catch (e) {
      log(e.toString());
    }
  }

  read() async {
    try {
      // final user = await _fire.collection('user').doc("").get();
      // user.data();
      final data = await _fire.collection('user').get();
      final user = data.docs[0];
      log(user["name"]);
      log(user["age"].toString());
    } catch (e) {
      log(e.toString());
    }
  }

  update() async {
    try {
      await _fire.collection('user').doc('8ff1njC0of3UD3gE8vMy').update({
        "name": "hyy",
        "age": 12,
        "Address": "hiiiii",
      });
    } catch (e) {
      log(e.toString());
    }
  }

  delete() async {
    try {
      await _fire.collection('user').doc('8ff1njC0of3UD3gE8vMy').delete();
    } catch (e) {
      log(e.toString());
    }
  }
}
