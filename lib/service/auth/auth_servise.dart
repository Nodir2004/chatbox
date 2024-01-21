import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => currentUser;

  

//sign in
  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    password,
    name,
    confirm
  ) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password,);

      _firestore.collection("Users").doc(userCredential.user!.uid).set({
       'uid': userCredential.user!.uid,
        'email':email,
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign up
  Future<UserCredential> signUpWithEmailPassword(
      String email, password,name,confirm) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(confirm: confirm,name: name,
              email: email, password:password);

              _firestore.collection("Users").doc(userCredential.user!.uid).set({
       'uid': userCredential.user!.uid,
        'email':email,
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign out
  Future<void> signOut() async {
    return await _auth.signOut();
  }


}
