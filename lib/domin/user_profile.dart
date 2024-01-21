import 'package:chatbox/widget/share_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class User_Profile extends StatefulWidget {
  const User_Profile({super.key});

  @override
  State<User_Profile> createState() => User_ProfileState();
}

class User_ProfileState extends State<User_Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff000000),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 73, right: 154, left: 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(44),
                              border: Border.all(color: const Color(0xff363F3B))),
                          child: Center(
                              child: SvgPicture.asset("assets/icon/left.svg")),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50,right: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 82,
                          height: 82,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(41)),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        SizedBox(width: 800,
                          child: Text(
                            "Jhon Abraham",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Caros',
                              fontWeight: FontWeight.w600,
                              height: 0.05,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          '@jhonabraham',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF797C7B),
                            fontSize: 12,
                            fontFamily: 'Circular Std',
                            fontWeight: FontWeight.w500,
                            height: 0.08,
                          ),
                        ),
                       
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 392,
              height: 560.2,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                color: Color(0xffFFFFFF),
              ),
              child: Column(
                children: [
                  Container(
                    width: 30,
                    color: Color(0xffE6E6E6),
                    height: 3,
                    child: const Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 24),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        ListTile(
                            leading: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(60)),
                            ),
                            title: Text(
                              "Nodirbek Norqobilov",
                              style: TextStyle(
                                color: Color(0xFF000D07),
                                fontSize: 20,
                                fontFamily: 'Caros',
                                fontWeight: FontWeight.w600,
                                height: 0.05,
                              ),
                            ),
                            subtitle: Text("Never give up 💪"),
                            trailing:
                                SvgPicture.asset("assets/icon/qrcode.svg"))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Color(0xffF5F6F6),
                    width: 375,
                    height: 1,
                    child: Divider(),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, top: 30),
                    child: Column(
                      children: [
                        share_content(
                          text: "Account",
                          iconName: 'assets/icon/account.svg',
                          subtite: "Privacy, security, change number",
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        share_content(
                          iconName: "assets/icon/message.svg",
                          text: "Chat",
                          subtite: 'Chat history,theme,wallpapers',
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                       
                        
                       
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
