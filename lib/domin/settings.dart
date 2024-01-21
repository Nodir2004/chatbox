import 'package:chatbox/domin/user_profile.dart';
import 'package:chatbox/widget/share_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff000000),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 94,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Container(
                      //   width: 44,
                      //   height: 44,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(44),
                      //       border: Border.all(color: const Color(0xff363F3B))),
                      //   child: Center(
                      //       child: SvgPicture.asset("assets/icon/left.svg")),
                      // ),
                      Center(
                        child: Text(
                          "Settings",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Caros',
                            fontWeight: FontWeight.w500,
                            height: 0.05,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 52,
            ),
            Container(
              width: 392.w,
              height: 612.h,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                color: Color(0xffFFFFFF),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                    width: 30,
                    color: const Color(0xffE6E6E6),
                    height: 3,
                    child: const Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 0),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        ListTile(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const User_Profile())),
                            leading: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(60)),
                            ),
                            title: const Text(
                              "Nodirbek Norqobilov",
                              style: TextStyle(
                                color: Color(0xFF000D07),
                                fontSize: 20,
                                fontFamily: 'Caros',
                                fontWeight: FontWeight.w600,
                                height: 0.05,
                              ),
                            ),
                            subtitle: const Text("Never give up 💪"),
                            trailing:
                                SvgPicture.asset("assets/icon/qrcode.svg"))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: const Color(0xffF5F6F6),
                    width: 375,
                    height: 1,
                    child: const Divider(),
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
                        share_content(
                          iconName: "assets/icon/qongiroq.svg",
                          text: 'Notifications',
                          subtite: 'Messages, group and others',
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        share_content(
                          iconName: "assets/icon/help.svg",
                          text: "Help",
                          subtite: 'Help center,contact us, privacy policy',
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        share_content(
                          iconName: "assets/icon/data.svg",
                          text: "Storage and data",
                          subtite: "Network usage, stogare usage",
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        share_content(
                          iconName: "assets/icon/friend.svg",
                          text: "Invite a friend",
                          subtite: "",
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 22,
                        )
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
