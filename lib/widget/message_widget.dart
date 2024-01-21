
import 'package:cloud_firestore_platform_interface/src/timestamp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageWidget extends StatelessWidget {
  final bool isMe;
  final String username;
  final String text;
 final String dateTime;
  
   MessageWidget({
 required this.dateTime,
    required this.username, required this.isMe, super.key,required this.text });

  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Column(crossAxisAlignment:! isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Row(
              children: [!isMe?SizedBox():
              Container(width: 40.w,
        height: 40.h,
        decoration: ShapeDecoration(
          image: const DecorationImage(
            image: NetworkImage("https://via.placeholder.com/40x40"),
            fit: BoxFit.cover,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(31),
          ),
        ),),
        const SizedBox(width: 12,),
             
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 0.0).r,
              
              height: 35.h,
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 16).r,
              decoration: BoxDecoration(
                  color: !isMe?const Color(0xff20A090):const Color(0xffF2F7FB),
                  borderRadius: BorderRadius.only(
                    topLeft:!isMe? Radius.circular(20):Radius.circular(0).r,
                    topRight: !isMe ? Radius.circular(0) : Radius.circular(20).r,
                    bottomLeft: Radius.circular(20).r,
                    bottomRight: Radius.circular(20).r,
                  ).r),
              child: Column(
                crossAxisAlignment:
                   ! isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(color:!isMe?Color(0xffFFFFFF):Color(0xff000E08)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8,),
           Text(dateTime,style: TextStyle(color: Color(0xff797C7B)),),
          ],
        ),
      ],
    );
  }
}
