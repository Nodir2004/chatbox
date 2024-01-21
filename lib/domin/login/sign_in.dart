import 'package:chatbox/domin/login/sign_up.dart';
import 'package:chatbox/domin/nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Sign_in extends StatefulWidget {
  Sign_in({Key? key}) : super(key: key);

  @override
  State<Sign_in> createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  // login method
//   void login(BuildContext context) async {
//     //auth service
//     final  authService = AuthService();
// //try login
//     try {
//       await authService.signInWithEmailAndPassword(
//          _emailcontroller.text, _passwordcontroller.text);
//     } catch (e) {
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text(e.toString()),
//         ),
//       );
//     }
//   }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, right: 24, left: 24).r,
          child: Column(
            children: [
              Center(
                child: Text(
                  "Log in to Chatbox",
                  style: TextStyle(
                    color: Color(0xFF000D07),
                    fontSize: 18.sp,
                    fontFamily: 'Caros',
                    fontWeight: FontWeight.w600,
                    height: 0.06.h,
                  ),
                ),
              ),
               SizedBox(
                height: 19.h,
              ),
               Center(
                child: Text(
                  "Welcome back! Sign in using your social\naccount or email to continue us",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF797C7B),
                    fontSize: 14.sp,
                    fontFamily: 'Circular Std',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.10,
                  ),
                ),
              ),
               SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 48.w,
                    height: 48.h,
                    decoration:  ShapeDecoration(
                      color: const Color(0xffFFFFFF),
                      shape: OvalBorder(
                        side: BorderSide(width: 1.w, color: const Color(0xFFA8B0AF)),
                      ),
                    ),
                    child: SvgPicture.asset("assets/icon/facebook.svg"),
                  ),
                   SizedBox(
                    width: 22.w,
                  ),
                  Container(
                    width: 48.w,
                    height: 48.h,
                    decoration:  ShapeDecoration(
                      color: const Color(0xffFFFFFF),
                      shape: OvalBorder(
                        side: BorderSide(width: 1.w, color: const Color(0xFFA8B0AF)),
                      ),
                    ),
                    child: SvgPicture.asset("assets/icon/google.svg"),
                  ),
                   SizedBox(
                    width: 22.w,
                  ),
                  Container(
                    width: 48.w,
                    height: 48.h,
                    decoration:  ShapeDecoration(
                      color: const Color(0xffFFFFFF),
                      shape: OvalBorder(
                        side: BorderSide(width: 1.w, color: const Color(0xFFA8B0AF)),
                      ),
                    ),
                    child: SvgPicture.asset(
                      "assets/icon/apple.svg",
                      // ignore: deprecated_member_use
                      color: const Color(0xff1A1A1A),
                    ),
                  ),
                ],
              ),
              // googlenet(),
               SizedBox(
                height: 30.h,
              ),
              ordivider(),
               SizedBox(
                height: 30.h,
              ),
              TextField(
                  controller: _emailcontroller,
                  obscureText: false,
                  decoration:  InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: "Your email",
                    labelStyle: TextStyle(
                      color: const Color(0xFF24786D),
                      fontSize: 14.sp,
                      fontFamily: 'Circular Std',
                      fontWeight: FontWeight.w500,
                      height: 0.07.h,
                      letterSpacing: 0.10,
                    ),
                  ),style: const TextStyle(color: Colors.black),),
               SizedBox(
                height: 30.h,
              ),
              TextField(
                  controller: _passwordcontroller,
                  obscureText: false,
                  decoration:  InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: const Color(0xFF24786D),
                      fontSize: 14.sp,
                      fontFamily: 'Circular Std',
                      fontWeight: FontWeight.w500,
                      height: 0.07.h,
                      letterSpacing: 0.10,
                    ),
                  ),style: const TextStyle(color: Colors.black),),
               SizedBox(
                height: 177.h,
              ),
              GestureDetector(
                onTap:
                    // login(context),
                    () async {
                  try {
                    UserCredential user = await auth.signInWithEmailAndPassword(
                        email: _emailcontroller.text,
                        password: _passwordcontroller.text);
                    // ignore: use_build_context_synchronously
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const NavBar()));
                  } catch (e) {
                    // ignore: use_build_context_synchronously
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(e.toString()),
                      ),
                    );
                  }
                },
                child: Container(
                  height: 48.h,
                  width: 327.w,
                  decoration: BoxDecoration(
                      color: const Color(0xff24786D),
                      borderRadius: BorderRadius.circular(16)),
                  child:  Center(
                      child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontFamily: 'Caros',
                      fontWeight: FontWeight.w600,
                    ),
                  )),
                ),
              ),
               SizedBox(
                height: 16.h,
              ),
              Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const Sign_up()));
                      },
                      child:  Text(
                        "Forgot password?",
                        style: TextStyle(
                          color: Color(0xFF24786D),
                          fontSize: 14.sp,
                          fontFamily: 'Circular Std',
                          fontWeight: FontWeight.w500,
                          height: 0.07.h,
                          letterSpacing: 0.10,
                        ),
                      ))),

               SizedBox(
                height: 37.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row googlenet() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 48.w,
          height: 48.h,
          decoration:  ShapeDecoration(
            color: const Color(0xFF1A1A1A),
            shape: OvalBorder(
              side: BorderSide(width: 1.w, color:const Color(0xFFA8B0AF)),
            ),
          ),
          child: SvgPicture.asset("assets/icon/facebook.svg"),
        ),
         SizedBox(
          width: 22.w,
        ),
        Container(
          width: 48.w,
          height: 48.h,
          decoration:  ShapeDecoration(
            color: const Color(0xFF1A1A1A),
            shape: OvalBorder(
              side: BorderSide(width: 1.w, color: const Color(0xFFA8B0AF)),
            ),
          ),
          child: SvgPicture.asset("assets/icon/google.svg"),
        ),
         SizedBox(
          width: 22.w,
        ),
        Container(
          width: 48.w,
          height: 48.h,
          decoration:  ShapeDecoration(
            color: const Color(0xFF1A1A1A),
            shape: OvalBorder(
              side: BorderSide(width: 1.w, color: const Color(0xFFA8B0AF)),
            ),
          ),
          child: SvgPicture.asset("assets/icon/apple.svg"),
        ),
      ],
    );
  }
}

Row ordivider() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
       SizedBox(
        width: 132.w,
        child: Divider(
          height: 1.h,
          color: Color(0xffCDD1D0),
        ),
      ),
       SizedBox(
        width: 15.w,
      ),
       Text(
        "OR",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFFD6E4DF),
          fontSize: 14.sp,
          fontFamily: 'Circular Std',
          fontWeight: FontWeight.w500,
          height: 0.07.h,
          letterSpacing: 0.10,
        ),
      ),
       SizedBox(
        width: 15.w,
      ),
      // ignore: sized_box_for_whitespace
      Container(
        width: 132.w,
        child:  Divider(
          height: 1.h,
          color: Color(0xffCDD1D0),
        ),
      ),
    ],
  );
}
