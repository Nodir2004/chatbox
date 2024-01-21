// import 'package:chatbox/firebase/auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   String? errorMessage = "";
//   bool isLogin = true;
//   final TextEditingController _controllerEmail = TextEditingController();
//   final TextEditingController _controllerPassword = TextEditingController();
//    final TextEditingController _controllerName = TextEditingController();

//  final TextEditingController _controllerConfirm = TextEditingController();


//   Future<void> signInWithEmailAndPassword() async {
//     try {
//       await Auth().signInWithEmailAndPassword(
//         name:_controllerName.text,confirm: _controllerConfirm.text,
//           email: _controllerEmail.text, password: _controllerPassword.text);
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         errorMessage = e.message;
//       });
//     }
//   }

//   Future<void> createUserWithEmailAndPassword() async {
//     try {
//       await Auth().createUserWithEmailAndPassword(
//         name:_controllerName.text,confirm:_controllerConfirm.text,
//           email: _controllerEmail.text, password: _controllerPassword.text);
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         errorMessage = e.message;
//       });
//     }
//   }

//   Widget _title() {
//     return Text("Firebase Auth");
//   }

//   Widget _entryFild(String title, TextEditingController controller) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: title,
//       ),
//     );
//   }

//   Widget _errorMessage() {
//     return Text(errorMessage == '' ? '' : 'Humm? $errorMessage');
//   }

//   Widget _submitButton() {
//     return ElevatedButton(
//         onPressed: isLogin
//             ? signInWithEmailAndPassword
//             : createUserWithEmailAndPassword,
//         child: Text(isLogin ? 'Login' : 'Register'));
//   }

//   Widget _loginOrRegistorButton() {
//     return TextButton(
//         onPressed: () {
//           setState(() {
//             isLogin = !isLogin;
//           });
//         },
//         child: Text(isLogin ? 'Registor instead' : 'Login instead'));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: AppBar(title: _title()),
//     body: Container(height: double.infinity,
//     width: double.infinity,
//     padding: EdgeInsets.all(20),
//     child: Column(children: [
//       _entryFild("confirm", _controllerConfirm),
//       _entryFild("name", _controllerName),
//       _entryFild('email', _controllerEmail),
//       _entryFild('password', _controllerPassword),
//       _errorMessage(),
//       _submitButton(),
//       _loginOrRegistorButton(),
//     ]),),);
//   }
// }
