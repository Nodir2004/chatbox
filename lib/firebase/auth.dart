// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:chatbox/service/chat/chat_service.dart';
// import 'package:flutter/material.dart';

// class Auth {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   User? get currentUser => _auth.currentUser;
//   Stream<User?> get authStateChanges => _auth.authStateChanges();

//   Future<UserCredential> signInWithEmailAndPassword(
//     String email,
//     String password,
//     String name,
//     String confirm, 
//   ) async {
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return userCredential;
//     } on FirebaseAuthException catch (e) {
//       throw Exception(e.code);
//     }
//   }

//   Future<UserCredential> signUpWithEmailPassword(
//     String email,
//     password,
//     name,
//     Sconfirm,
//   ) async {
//     try {
//       UserCredential userCredential = await _auth
//           .createUserWithEmailAndPassword(email: email, password: password);

//       _firestore.collection("Users").doc(userCredential.user!.uid).set({
//         "uid": userCredential.user!.uid,
//         "email": email,
//       });

//       return userCredential;
//     } on FirebaseAuthException catch (e) {
//       throw Exception(e.code);
//     }
//   }

//   Future<void> signOut() async {
//     await _auth.signOut();
//   }

//   createUserWithEmailAndPassword(String text, 
//       {required String name,
//       required String confirm,
//       required String email,
//       required String password}) {}
// }
