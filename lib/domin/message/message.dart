import 'package:chatbox/data/models/message_model.dart';
import 'package:chatbox/widget/message_widget.dart';
import 'package:chatbox/widget/share_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Message extends StatefulWidget {
  final String userName;
  final String userUid;
  final String senderName;
  const Message({
    super.key,
    required this.senderName,
    required this.userName,
    required this.userUid,
  });

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  bool isText = true;
  bool inprotses = false;
  bool showBottoms = false;
  final TextEditingController _massagecontroller = TextEditingController();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(microseconds: 200),
          curve: Curves.fastLinearToSlowEaseIn);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Future<List<MessageModel>> getAllMinds() async {
    //   final db = FirebaseFirestore.instance;

    //   return await db.collection("message").get().then((value) =>
    //       value.docs.map((e) => MessageModel.fromJson(e.data())).toList());
    // }
    getAllMinds() => FirebaseFirestore.instance
        .collection("message")
        .orderBy("dateTime", descending: false)
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            'assets/icon/left.svg',
            // ignore: deprecated_member_use
            color: Colors.black,
          ),
        ),
        toolbarHeight: 80,
        centerTitle: true,
        title: Row(
          children: [
            Stack(children: [
              Container(
                height: 44.h,
                width: 44.w,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(31)),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 32, left: 35).r,
                  child: SvgPicture.asset("assets/icon/online.svg")),
            ]),
             SizedBox(
              width: 12.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.userName,
                  style:  TextStyle(
                    color: const Color(0xFF000D07),
                    fontSize: 16.sp,
                    fontFamily: 'Caros',
                    fontWeight: FontWeight.w500,
                    height: 0.06.h,
                  ),
                ),
                 SizedBox(
                  height: 20.h,
                ),
                 Text(
                  "Active now",
                  style: TextStyle(
                    color: Color(0xFF797C7B),
                    fontSize: 12.sp,
                    fontFamily: 'Circular Std',
                    fontWeight: FontWeight.w500,
                    height: 0.08.h,
                  ),
                ),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icon/call_icon.svg",
                // ignore: deprecated_member_use
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/icon/video.svg")),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 24,
          left: 24,
        ).r,
        child: Column(children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String,dynamic>>>(
                stream: getAllMinds(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    List<MessageModel> message = snapshot.data!.docs
                        .map((e) => MessageModel.fromJson(e.data()))
                        .toList();

                    return ListView.builder(
                      shrinkWrap: true,
                      controller: _scrollController,
                      itemCount: message.length,
                      itemBuilder: ((context, index) {
                        if (message[index].uid ==
                            (widget.userUid +
                                FirebaseAuth.instance.currentUser!.uid)) {
                          print(
                            "${message[index].dateTime.toDate().hour}:${message[index].dateTime.toDate().minute}",
                          );
                          return MessageWidget(
                            dateTime:
                                "${message[index].dateTime.toDate().hour}:${message[index].dateTime.toDate().minute}",
                            isMe: message[index].getterUid ==
                                FirebaseAuth.instance.currentUser?.uid,
                            text: message[index].message,
                            username: message[index].senderName ?? "Umknown",
                          );
                        } else if (message[index].uid ==
                            (FirebaseAuth.instance.currentUser!.uid +
                                widget.userUid)) {
                          if (message[index].uid ==
                              (widget.userUid +
                                  FirebaseAuth.instance.currentUser!.uid)) {
                            return MessageWidget(
                              dateTime:
                                  "${message[index].dateTime.toDate().hour}:${message[index].dateTime.toDate().minute}",
                              isMe: message[index].getterUid ==
                                  FirebaseAuth.instance.currentUser?.uid,
                              text: message[index].message,
                              username: widget.userName,
                            );
                          }
                        }
                        return const SizedBox();
                      }),
                    );
                  }
                  return Container();
                }),
          ),
          SizedBox(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => FractionallySizedBox(
                                  heightFactor: 1.9,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Color(0xffFFFFFF),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(40))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 24,
                                        left: 24,
                                        right: 24,
                                      ).r,
                                      child: Column(children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(
                                                onPressed: () {},
                                                icon: SvgPicture.asset(
                                                    "assets/icon/x.svg")),
                                            const Text(
                                              "Share Content",
                                              style: TextStyle(
                                                color: Color(0xFF000D07),
                                                fontSize: 16,
                                                fontFamily: 'Caros',
                                                fontWeight: FontWeight.w500,
                                                height: 0.06,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                          ],
                                        ),
                                         SizedBox(
                                          height: 20.h,
                                        ),
                                        share_content(
                                          text: "Camera",
                                          iconName: 'assets/icon/camera.svg',
                                          subtite: "Share photos and videos",
                                          onTap: () {},
                                        ),
                                         SizedBox(
                                          height: 20.h,
                                        ),
                                         Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                                width: 292.w, child: Divider()),
                                          ],
                                        ),
                                         SizedBox(
                                          height: 20.h,
                                        ),
                                        share_content(
                                          iconName: "assets/icon/doc.svg",
                                          text: "Documents",
                                          subtite: 'Share your files',
                                          onTap: () {},
                                        ),
                                         SizedBox(
                                          height: 20.h,
                                        ),
                                         Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                                width: 292.w, child: Divider()),
                                          ],
                                        ),
                                         SizedBox(
                                          height: 20.h,
                                        ),
                                        share_content(
                                          iconName: "assets/icon/chart.svg",
                                          text: 'Create a poll',
                                          subtite:
                                              'Create a poll for any querry',
                                          onTap: () {},
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                                width: 292, child: Divider()),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        share_content(
                                          iconName: "assets/icon/media.svg",
                                          text: "Media",
                                          subtite: 'Share photos and videos',
                                          onTap: () {},
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                                width: 292, child: Divider()),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        share_content(
                                          iconName: "assets/icon/contacts.svg",
                                          text: "Contact",
                                          subtite: "Share your contacts",
                                          onTap: () {},
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                                width: 292, child: Divider()),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        share_content(
                                          iconName: "assets/icon/location.svg",
                                          text: "Location",
                                          subtite: "Share your location",
                                          onTap: () {},
                                        ),
                                      ]),
                                    ),
                                  ),
                                ));
                      },
                      icon: SvgPicture.asset("assets/icon/sikripka.svg")),
                  SizedBox(
                    height: 40.h, width: 190.w,
                    // child: Container(
                    //  width: 21,
                    //  height: 47,
                    // decoration: BoxDecoration(
                    //     border: Border.all(color: const Color(0xffF3F6F6)),
                    //     borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          showBottoms = true;
                          setState(() {});
                        } else {
                          showBottoms = false;
                          setState(() {});
                        }
                      },
                      controller: _massagecontroller,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        hintText: "Xabar yozing",
                        fillColor: Color(0xffF3F6F6),
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                    // ),
                  ),
                  showBottoms
                      ? IconButton(
                          onPressed: () async {
                            _scrollController.animateTo(
                                _scrollController.position.maxScrollExtent,
                                duration: Duration(microseconds: 200),
                                curve: Curves.fastLinearToSlowEaseIn);

                            inprotses = true;
                            setState(() {});
                            try {
                              if (_massagecontroller.text != "") {
                                await FirebaseFirestore.instance
                                    .collection("message")
                                    .add({
                                  "dateTime": Timestamp.now(),
                                  "senderName": FirebaseAuth
                                      .instance.currentUser?.displayName,
                                  "getterName": widget.userName,
                                  "getterUid": widget.userUid,
                                  "message": _massagecontroller.text,
                                  "senderUid":
                                      FirebaseAuth.instance.currentUser!.uid,
                                  "uid": widget.userUid +
                                      FirebaseAuth.instance.currentUser!.uid,
                                });
                                setState(() {
                                  inprotses = false;
                                });
                                _massagecontroller.clear();
                              }
                            } catch (e) {
                              print(e.toString());
                            }

                            //               MindModel name = MindModel(
                            //     name: _controllerName.text.trim(),
                            //     you: "Salom men chatbox ishlatayapman".trim());
                            // var mymind = await db.collection("name").add(name.toJson());
                            // await db
                            //     .collection("name")
                            //     .doc(mymind.id)
                            //     .update({"docId": mymind.id});
                            // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            //     content: Text("Siz mufaqqatli ro'yxatdan o'tdingiz")));
                            // _controllerName.clear();
                          },
                          icon: const Icon(Icons.send))
                      : Row(children: [
                          IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset("assets/icon/camera.svg")),
                          IconButton(
                              onPressed: () {},
                              icon:
                                  SvgPicture.asset("assets/icon/mikrafon.svg")),
                        ]),
                ]),
          )
        ]),
      ),
    );
  }
}
