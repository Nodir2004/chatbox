import 'package:chatbox/data/models/mind_model.dart';
import 'package:chatbox/domin/nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: camel_case_types
class Sign_up extends StatefulWidget {
  const Sign_up({super.key});

  @override
  State<Sign_up> createState() => _Sign_upState();
}

// ignore: camel_case_types
class _Sign_upState extends State<Sign_up> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConfirm = TextEditingController();

  // void creatacount(BuildContext context) async {
  //   final _auth = AuthService();
  //   //password match=>create user
  //   if (_controllerPassword.text == _controllerConfirm.text) {
  //  try {
  //       _auth.signInWithEmailAndPassword(
  //           _controllerEmail.text, _controllerName.text,_controllerConfirm.text,_controllerPassword.text.)
  //     } catch (e) {
  //       showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //           title: Text(e.toString()),
  //         ),
  //       );
  //     }
  //   } else {
  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text("Password don't match"),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
      appBar: AppBar(
        // ignore: deprecated_member_use
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            "assets/icon/left.svg",
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60, right: 24, left: 24).r,
          child: Column(
            children: [
               Center(
                child: Text(
                  "Sign up with Email",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: 'Caros',
                    fontWeight: FontWeight.w600,
                    height: 0.06.h,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const SizedBox(
                width: 293,
                child: Text(
                  'Get chatting with friends and family today by signing up for our chat app!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF797C7B),
                    fontSize: 14,
                    fontFamily: 'Circular Std',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.10,
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              TextField(
                  controller: _controllerName,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Your name",
                    labelStyle: TextStyle(
                      color: Color(0xFF24786D),
                      fontSize: 14,
                      fontFamily: 'Circular Std',
                      fontWeight: FontWeight.w500,
                      height: 0.07,
                      letterSpacing: 0.10,
                    ),
                  ),style: TextStyle(color: Colors.black),),
              const SizedBox(
                height: 30,
              ),
              TextField(
                  controller: _controllerEmail,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Your email",
                    labelStyle: TextStyle(
                      color: Color(0xFF24786D),
                      fontSize: 14,
                      fontFamily: 'Circular Std',
                      fontWeight: FontWeight.w500,
                      height: 0.07,
                      letterSpacing: 0.10,
                    ),
                  ),style: TextStyle(color: Colors.black),),
              const SizedBox(
                height: 30,
              ),
              TextField(
                  controller: _controllerPassword,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: Color(0xFF24786D),
                      fontSize: 14,
                      fontFamily: 'Circular Std',
                      fontWeight: FontWeight.w500,
                      height: 0.07,
                      letterSpacing: 0.10,
                      
                    ),
                  ),style: TextStyle(color: Colors.black),),
              const SizedBox(
                height: 30,
              ),
              TextField(
                  controller: _controllerConfirm,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Confirm Password",
                    labelStyle: TextStyle(
                      color: Color(0xFF24786D),
                      fontSize: 14,
                      fontFamily: 'Circular Std',
                      fontWeight: FontWeight.w500,
                      height: 0.07,
                      letterSpacing: 0.10,
                    ),
                  ),style: TextStyle(color: Colors.black),),
              const SizedBox(
                height: 121,
              ),
              GestureDetector(
                onTap:
                    //creatacount(context),
                    () async {
                  final db = FirebaseFirestore.instance;
                  try {
                    UserCredential user =
                        await auth.createUserWithEmailAndPassword(
                      email: _controllerEmail.text,
                      password: _controllerPassword.text,
                      name: _controllerName.text,
                      confirm: _controllerConfirm.text,
                    );

                    MindModel name = MindModel(
                        name: _controllerName.text.trim(),
                        you: "Salom ".trim());
                    var mymind = await db.collection("name").add(name.toJson());
                    await db
                        .collection("name")
                        .doc(mymind.id)
                        .update({"docId": mymind.id});
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Siz mufaqqatli ro'yxatdan o'tdingiz")));
                    _controllerName.clear();

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const NavBar()));
                  } catch (e) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(e.toString(),style: TextStyle(color: Colors.black),),
                      ),
                    );
                  }
                },
                child: Container(
                  height: 48,
                  width: 327,
                  decoration: BoxDecoration(
                      color: const Color(0xff24786D),
                      borderRadius: BorderRadius.circular(16)),
                  child: const Center(
                    child: Text(
                      "Create an account",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 16,
                        fontFamily: 'Caros',
                        fontWeight: FontWeight.w600,
                        height: 0.06,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
