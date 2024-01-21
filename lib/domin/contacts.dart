import 'package:chatbox/data/models/mind_model.dart';
import 'package:chatbox/domin/message/home.dart';
import 'package:chatbox/widget/contact_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Contacts extends StatefulWidget {
  const Contacts({
    super.key,
  });

  @override
  State<Contacts> createState() => _ContactsState();
}

final TextEditingController _controllerName = TextEditingController();

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    getAllMinds() => FirebaseFirestore.instance.collection("name").where("docId",isGreaterThan: FirebaseAuth.instance.currentUser?.uid).snapshots();
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
                          child: searchwidget()),
                      const Text(
                        "Contact",
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
                            child: SvgPicture.asset(
                                "assets/icon/contact_icon.svg")),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(left: 24)),
                        Container(
                          width: 92,
                          height: 16,
                          child: const Text(
                            "My Contact",
                            style: TextStyle(
                              color: Color(0xFF000D07),
                              fontSize: 16,
                              fontFamily: 'Caros',
                              fontWeight: FontWeight.w500,
                              height: 0.06,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: DraggableScrollableSheet(
                        initialChildSize: 1,
                        minChildSize: 1,
                        maxChildSize: 1,
                        builder: (context, scrollController) =>
                            SingleChildScrollView(
                              controller: scrollController,
                          scrollDirection: Axis.vertical,
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
                                    List<MindModel> name = snapshot.data!.docs
                                        .map(
                                            (e) => MindModel.fromJson(e.data()))
                                        .toList();
                                    return SingleChildScrollView(
                                      child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemCount: name.length,
                                          itemBuilder: (context, index) {
                                            return ContactWidget(
                                              name: name[index],
                                              onUpdateTap: getAllMinds,
                                            );
                                          }),
                                    );
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
