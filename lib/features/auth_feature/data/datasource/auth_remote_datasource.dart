import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class AuthRemoteDatasource {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  void _addUser(
      String email , 
      String pass , 
      String name , 
      String id
    ) async {
    await _firebaseFirestore.collection("users").doc(id).set({
      "email" : email,
      "pass" : pass,
      "name" : name,
    });
  }

Future<UserModel> _getUser(String id) async {

    // 1. Verify the user is authenticated
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null || currentUser.uid != id) {
      throw Exception('Unauthorized: User not authenticated or ID mismatch');
    }

    // 2. Get user document
    final snapshot = await _firebaseFirestore
        .collection("users")
        .doc(id)
        .get();

    // 3. Check if document exists
    if (!snapshot.exists) {
      throw Exception('User document not found');
    }

    // 4. Validate data
    final userData = snapshot.data();
    if (userData == null) {
      throw Exception('User data is empty');
    }

    // 5. Return successfully
    return UserModel.fromJson({
      "id":id,
      "name":userData["name"],
      "email":userData["email"],
      "pass":userData["pass"],
    });
}

  Future<UserModel> signUp(String email ,String pass , String name) async {

    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: pass
    );

    _addUser(
      email, 
      pass,
      name,
      userCredential.user!.uid
    );
    return UserModel.fromJson({
        "email" : email,
        "pass" : pass,
        "name" : name,
        "id" : userCredential.user!.uid,
      });
    }

  Future<UserModel> signIn(String email , String pass) async {

    final userCredential = await _firebaseAuth
      .signInWithEmailAndPassword(
          email: email, 
          password: pass
      );
      final x = await _getUser(userCredential.user!.uid);
      return x;

    }
}