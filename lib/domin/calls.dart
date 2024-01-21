import 'package:chatbox/data/models/mind_model.dart';
import 'package:chatbox/domin/message/home.dart';
import 'package:chatbox/domin/message/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Calls extends StatefulWidget {
  const Calls({super.key});

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    // Future<List<MindModel>> getAllMinds() async {
    //   final db = FirebaseFirestore.instance;

    //   return await db.collection("name").get().then((value) =>
    //       value.docs.map((e) => MindModel.fromJson(e.data())).toList());
    // }
    getAllMinds()=>FirebaseFirestore.instance.collection("name").where("docId",isGreaterThan: FirebaseAuth.instance.currentUser?.uid).snapshots();

    

    return Scaffold(
        backgroundColor: const Color(0xff000000),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 73, right: 24, left: 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(44),
                              border:
                                  Border.all(color: const Color(0xff363F3B))),
                          child: const searchwidget()),
                      const Text(
                        "Calls",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Caros',
                          fontWeight: FontWeight.w500,
                          height: 0.05,
                        ),
                      ),
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(34),
                            border: Border.all(color: const Color(0xff363F3B))),
                        child: Center(
                            child:
                                SvgPicture.asset("assets/icon/call_icon.svg")),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
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
              child: Padding(
                padding: const EdgeInsets.only(top: 14),
                child: Column(
                  children: [
                    Container(
                      width: 30,
                      color: Color(0xffE6E6E6),
                      height: 3,
                      child: const Divider(),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(padding: EdgeInsets.only(left: 24)),
                        Container(
                          child: const Text(
                            "Recent",
                            style: TextStyle(
                              color: Color(0xFF000D07),
                              fontSize: 16,
                              fontFamily: 'Caros',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: DraggableScrollableSheet(
                        initialChildSize: 1,
                        minChildSize: 1,
                        maxChildSize: 1,
                        builder: (context, scrollController) =>
                            SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          controller: scrollController,
                          child: SizedBox(
                            width: 382,
                            height: 680,
                            child: StreamBuilder(
                                stream: getAllMinds(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  if (snapshot.hasData) {
                                    List<MindModel> name =
                                        snapshot.data!.docs.map((e) =>MindModel.fromJson(e.data()) ).toList();
                                    return ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount: name.length,
                                        itemBuilder: (context, index) {
                                          return Dismissible(
                                              onDismissed: (direction) {},
                                              key: const ValueKey(Key),
                                              child: ListTile(
                                                onTap: () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Message(senderName: name[index].name,
                                                              userUid:
                                                                  name[index]
                                                                      .name,
                                                              userName:
                                                                  name[index]
                                                                      .name,
                                                              // userName:
                                                              //     name[index]
                                                              //         .name,
                                                              // userUid:
                                                              //     name[index]
                                                              //         .docId!,
                                                              // message:
                                                              //     name[index]
                                                              //         .you,
                                                            ))),
                                                leading: Container(
                                                  width: 52,
                                                  height: 52,
                                                  decoration: BoxDecoration(
                                                      color: Colors.amber,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              31)),
                                                ),
                                                title: Text(
                                                  name[index].name,
                                                  style: const TextStyle(
                                                    color: Color(0xFF000D07),
                                                    fontSize: 20,
                                                    fontFamily: 'Caros',
                                                    fontWeight: FontWeight.w500,
                                                    height: 0.05,
                                                  ),
                                                ),
                                                trailing: SizedBox(
                                                  width: 96,
                                                  child: Row(
                                                    children: [
                                                      IconButton(
                                                          onPressed: () {},
                                                          icon: SvgPicture.asset(
                                                              "assets/icon/calls.svg")),
                                                      IconButton(
                                                          onPressed: () {},
                                                          icon: SvgPicture.asset(
                                                              "assets/icon/video.svg")),
                                                    ],
                                                  ),
                                                ),
                                                subtitle: SizedBox(
                                                  width: 30,
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          "assets/icon/call_ui.svg"),
                                                      const Text(
                                                        'Yesterday, 07:35 PM',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF797C7A),
                                                          fontSize: 12,
                                                          fontFamily:
                                                              'Circular Std',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          height: 0.08,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                onLongPress: () {},
                                              ));
                                        });
                                  }
                                  return Container();
                                }),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
