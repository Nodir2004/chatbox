// import 'package:chatbox/domin/nav_bar.dart';
// import 'package:chatbox/domin/onboarding.dart';
// import 'package:chatbox/firebase/auth.dart';
// import 'package:flutter/material.dart';

// class WidgetTre extends StatefulWidget {
//   const WidgetTre({super.key});

//   @override
//   State<WidgetTre> createState() => _WidgetTreState();
// }

// class _WidgetTreState extends State<WidgetTre> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//         stream: Auth().authStateChanges,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return Nav_Bar();
//           } else {
//             return Onboarding();
//           }
//         });
//   }
// }
