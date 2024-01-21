import 'package:chatbox/domin/calls.dart';
import 'package:chatbox/domin/contacts.dart';
import 'package:chatbox/domin/message/home.dart';
import 'package:chatbox/domin/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBar extends StatefulWidget {
  const NavBar( {super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
  
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icon/message.svg", color: const Color(0xff797C7B),),
              label: "Message",
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icon/calls.svg"),
                label: "Calls"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icon/contacts.svg",
                ),
                label: "Contacts"),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icon/settings.svg"),
              label: "Settings",
            )
          ],
          currentIndex: currentPageIndex,
          onTap: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedItemColor:const Color(0xff24786D),
          unselectedItemColor:const Color(0xff24786D),
          // indicatorColor: Color(0xff24786D),

          backgroundColor: const Color(0xffFFFFFF),
        ),
        body: [
        
const Home(),
          const Calls(),
          const Contacts(),
          const Settings(),
        ][currentPageIndex]);
  }
}
