import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class AuthRemoteDatasource {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  void _addUser(
      String name , 
      String pass , 
      String email , 
      String id
    ) async {
    await _firebaseFirestore.collection("users").doc(id).set({
      "email" : email,
      "pass" : pass,
      "name" : name,
    });
  }

  Future<UserModel> _getUser(String id) async {
    final snapshot = await _firebaseFirestore
    .collection("users")
    .doc(id)
    .get();
    
    return UserModel.fromJson(snapshot.data()!);
  }

  Future<UserModel> signUp(String name , String pass , String email) async {

    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: pass
    );

    _addUser(
      name, 
      pass,
      email, 
      userCredential.user!.uid
    );
    return UserModel.fromJson({
        "id" : userCredential.user!.uid,
        "email" : email,
        "pass" : pass,
        "name" : name,
      });
    }

  Future<UserModel> signIn(String email , String pass) async {

    final userCredential = await _firebaseAuth
      .signInWithEmailAndPassword(
          email: email, 
          password: pass
      );

      return await _getUser(userCredential.user!.uid);

    }
  }