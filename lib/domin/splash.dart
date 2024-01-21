import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class chatbox extends StatefulWidget {
  const chatbox({super.key});

  @override
  State<chatbox> createState() => _chatboxState();
}

class _chatboxState extends State<chatbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xffFFFFFF),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
               
                   Container(
              width: 57.48,
              height: 69.31,
             child: SvgPicture.asset("assets/icon/c.svg"),
            ),
                  SizedBox(height: 23.69,),
                   Container(
                    height: 40,
                    width: 154,
                     child: Text("Chatbox",
                      textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF001815),
                fontSize: 40,
                fontStyle: FontStyle.italic,
                fontFamily: 'Circular Std',
                fontWeight: FontWeight.w500,
                height: 0.03,
              ),),
                   )
                ],
              ),
      ),
          
        
      
    );
  }
}