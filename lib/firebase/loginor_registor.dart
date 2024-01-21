import 'package:chatbox/domin/login/sign_in.dart';
import 'package:chatbox/domin/login/sign_up.dart';
import 'package:flutter/material.dart';
class LoginOrRegistor extends StatefulWidget {
  const LoginOrRegistor({super.key});

  @override
  State<LoginOrRegistor> createState() => _LoginOrRegistorState();
}

class _LoginOrRegistorState extends State<LoginOrRegistor> {
 
 bool showLoginPage = true;

 void togglePages(){
  setState(() {
    showLoginPage = !showLoginPage;
  });
 }
  @override
  Widget build(BuildContext context) {
   if(showLoginPage){
    return Sign_in();
   }else{
    return Sign_up();
   }
  }
}