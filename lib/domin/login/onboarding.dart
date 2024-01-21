import 'package:chatbox/domin/login/sign_in.dart';
import 'package:chatbox/domin/login/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 24,left: 24).r,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icon/c_oq.svg"),
                  SizedBox(
                    width: 6.w,
                  ),
                  Text(
                    "Chatbox",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontFamily: 'Circular Std',
                      fontWeight: FontWeight.w500,
                      height: 0.07,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 46.h,
              ),
              SizedBox(
                width: 338.w,
                height: 312.h,
                child: Text(
                  "Connect\nfriends\neasily &\nquickly",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 68.sp,
                    fontFamily: 'Caros',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 284.w,
                    height: 52.h,
                    child: Text(
                      "Our chat app is the perfect way to stay\nconnected with friends and family.",
                      style: TextStyle(
                        color: const Color(0xFFB9C1BE),
                        fontSize: 16.sp,
                        fontFamily: 'Circular Std',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 38.h,
              ),
              googlenet(),
              SizedBox(
                height: 37.h,
              ),
              ordivider(),
              SizedBox(
                height: 37.h,
              ),
              InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Sign_up())),
                child: Container(
                    height: 48.h,
                    width: 327.w,
                    decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: Text(
                        'Sign up withn mail',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF000D07),
                          fontSize: 16.sp,
                          fontFamily: 'Caros',
                          fontWeight: FontWeight.w500,
                         // height: 0.06.h,
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: 46.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Existing account?",
                    style: TextStyle(
                      color: const Color(0xFFB8C1BD),
                      fontSize: 14.sp,
                      fontFamily: 'Circular Std',
                      fontWeight: FontWeight.w500,
                      height: 0.07.h,
                      letterSpacing: 0.10,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Sign_in()));
                      },
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontFamily: 'Circular Std',
                          fontWeight: FontWeight.w500,
                          height: 0.07.h,
                          letterSpacing: 0.10,
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 27.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  Row ordivider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 132.w,
          child: Divider(
            height: 1.h,
            color: const Color(0xffCDD1D0),
          ),
        ),
        SizedBox(
          width: 15.w,
        ),
        Text(
          "OR",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFFD6E4DF),
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
        SizedBox(
          width: 132,
          child: Divider(
            height: 1.h,
            color: const Color(0xffCDD1D0),
          ),
        ),
      ],
    );
  }

  Row googlenet() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 48.w,
          height: 48.h,
          decoration: ShapeDecoration(
            color: const Color(0xFF1A1A1A),
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
          decoration: ShapeDecoration(
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
          decoration: ShapeDecoration(
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
