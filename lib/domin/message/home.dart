import 'package:chatbox/data/models/mind_model.dart';
import 'package:chatbox/domin/message/message.dart';
import 'package:chatbox/domin/search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    getAllMinds() => FirebaseFirestore.instance
        .collection("name")
        .where("docId", isNotEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .snapshots();

    return SafeArea(
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, right: 24, left: 24).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 44.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(44).r,
                          border: Border.all(color: const Color(0xff363F3B))),
                      child: const searchwidget(),
                    ),
                    Text(
                      "Home",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontFamily: 'Caros',
                        fontWeight: FontWeight.w500,
                        height: 0.05,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 44.w,
                        height: 44.h,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(44)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                children: [
                  Padding(padding: const EdgeInsets.only(left: 5, right: 5).r),
                  SizedBox(
                    width: 350.w,
                    height: 85.h,
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
                                .map((e) => MindModel.fromJson(e.data()))
                                .toList();
                            return ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                width: 10.w,
                              ),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: name.length,
                              itemBuilder: (context, index) => Column(
                                children: [
                                  Container(
                                    width: 58.w,
                                    height: 58.h,
                                    decoration: BoxDecoration(
                                        color: Colors.greenAccent,
                                        borderRadius:
                                            BorderRadius.circular(52).r,
                                        border: Border.all(
                                          color: const Color(0xffFFFFFF),
                                          width: 3.w,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Expanded(
                                    child: Text(
                                      name[index].name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontFamily: 'Caros',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }
                          return Container();
                        }),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Expanded(
            child: DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 1,
              maxChildSize: 1,
              builder: (context, scrollController) => SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                child: Container(
                  width: 392.w,
                  height: 612.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(50).r,
                        topRight: const Radius.circular(50).r),
                    color: const Color(0xffFFFFFF),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 14).r,
                    child: Column(
                      children: [
                        Container(
                          width: 30.w,
                          color: const Color(0xffE6E6E6),
                          height: 3.h,
                          child: const Divider(),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          width: 382.w,
                          height: 483.h,
                          child: StreamBuilder(
                              stream: getAllMinds(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                                if (snapshot.hasData) {
                                  List<MindModel> name =
                                      snapshot.data!.docs.map((e) {
                                    return MindModel.fromJson(e.data());
                                  }).toList();

                                  return ListView.builder(
                                      // padding: const EdgeInsets.only(top: 10),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: name.length,
                                      itemBuilder: (context, index) {
                                        return Slidable(
                                          direction: Axis.horizontal,
                                          closeOnScroll: true,
                                          groupTag: Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: SvgPicture.asset(
                                                      "assets/icon/camera.svg"))
                                            ],
                                          ),
                                          child: ListTile(
                                            onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Message(
                                                  userName: name[index].name,
                                                  userUid: name[index]
                                                      .docId
                                                      .toString(),
                                                  senderName: name[index].name,
                                                ),
                                              ),
                                            ),
                                            leading: Stack(children: [
                                              Container(
                                                width: 52.w,
                                                height: 52.h,
                                                decoration: BoxDecoration(
                                                    color: Colors.amber,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            31).r),
                                              ),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                              top: 42, left: 38)
                                                          .r,
                                                  child: SvgPicture.asset(
                                                      "assets/icon/online.svg"))
                                            ]),
                                            title: Text(
                                              name[index].name,
                                              style:  TextStyle(
                                                color: Color(0xFF000D07),
                                                fontSize: 20.sp,
                                                fontFamily: 'Caros',
                                                fontWeight: FontWeight.w500,
                                                height: 0.05.h,
                                              ),
                                            ),
                                            subtitle: SizedBox(
                                              width: 50.w,
                                              child: Text(
                                                name[index].you,
                                                style:  TextStyle(
                                                  color: const Color(0xFF797C7A),
                                                  fontSize: 12.sp,
                                                  fontFamily: 'Circular Std',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0.08.h,
                                                ),
                                              ),
                                            ),
                                            trailing: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                 Text(
                                                  "2 min ago",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color: Color(0xFF797C7B),
                                                    fontSize: 12.h,
                                                    fontFamily: 'Circular Std',
                                                    fontWeight: FontWeight.w500,
                                                    height: 0.08,
                                                  ),
                                                ),
                                                 SizedBox(
                                                  height: 12.h,
                                                ),
                                                Container(
                                                  height: 21.h,
                                                  width: 21.w,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffF04A4C),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12).r),
                                                  child:  Center(
                                                      child: Text(
                                                    "4",
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12.sp,
                                                      fontFamily:
                                                          'Circular Std',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 0.08.h,
                                                    ),
                                                  )),
                                                )
                                              ],
                                            ),
                                            onLongPress: () {},
                                          ),
                                        );
                                      });
                                }
                                return Container();
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class searchwidget extends StatelessWidget {
  const searchwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Search()));
        },
        icon: SvgPicture.asset("assets/icon/search.svg"));
    // GestureDetector(
    //     onTap: () => Navigator.push(
    //         context, MaterialPageRoute(builder: (context) => Search())),
    //     child: Center(child: SvgPicture.asset("assets/icon/search.svg")));
  }
}
