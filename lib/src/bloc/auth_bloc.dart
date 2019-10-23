import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthBloc{

  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }

  final db = Firestore.instance;
  Future<void> addDataUser(String authid,userModel) async {
      await db
        .collection('users').document(authid).setData(userModel).catchError((e) {
        print(e);
      });
    }
  getDataUser() async {
    return await db.collection('users').snapshots();
  }
  updateDataUser(String authID, newValues) async {
    await db
        .collection('users')
        .document(authID)
        .updateData(newValues)
        .catchError((e) {
      print(e);
    });
  }
  deleteData(authID) async {
    await db
        .collection('users')
        .document(authID)
        .delete()
        .catchError((e) {
      print(e);
    });
  }
}