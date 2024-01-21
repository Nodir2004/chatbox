import 'package:chatbox/domin/login/sign_up.dart';
import 'package:chatbox/domin/message/home_page.dart';
import 'package:chatbox/domin/login/onboarding.dart';
import 'package:chatbox/domin/login/sign_in.dart';
import 'package:chatbox/domin/nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 52),
        child:const Onboarding()
      ),
    );
  }
}
