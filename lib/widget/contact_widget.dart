import 'package:chatbox/data/models/mind_model.dart';
import 'package:chatbox/domin/user_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ContactWidget extends StatefulWidget {
  MindModel name;
  VoidCallback onUpdateTap;
  ContactWidget({super.key, required this.name,required this.onUpdateTap,});

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  final TextEditingController _controllerName = TextEditingController();

@override
  void initState() {

_controllerName.text=widget.name.name;   
 super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Dismissible(
          onDismissed: (direction) {},
          key: const ValueKey(Key),
          child: ListTile(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => User_Profile())),
            leading: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(31)),
            ),
            title: Text(
              widget.name.name,
              style: TextStyle(
                color: Color(0xFF000D07),
                fontSize: 20,
                fontFamily: 'Caros',
                fontWeight: FontWeight.w500,
                height: 0.05,
              ),
            ),
            trailing: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: Container(
                              height: 200,
                              width: 100,
                              child: TextField(style: TextStyle(color: Colors.black),
                                  controller: _controllerName,
                                  obscureText: false,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: "Your name",
                                    labelStyle: TextStyle(
                                      color: Color(0xFF24786D),
                                      fontSize: 14,
                                      fontFamily: 'Circular Std',
                                      fontWeight: FontWeight.w500,
                                      height: 0.07,
                                      letterSpacing: 0.10,
                                    ),
                                  )),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancel")),
                              TextButton(
                                  onPressed: () {
                                    final db = FirebaseFirestore.instance;
                                    print(widget.name.toJson());
                                    widget.name.name=_controllerName.text.trim();
                                    db
                                        .collection("name")
                                        .doc(widget.name.docId)
                                        .update(widget.name.toJson());
                                        Navigator.pop(context);
                                        widget.onUpdateTap;
                                  },
                                  child: Text("Updet"))
                            ],
                          ));
                },
                icon: Icon(Icons.edit_outlined)),
            
            subtitle: Text(
              widget.name.you,
              style: TextStyle(
                color: Color(0xFF797C7A),
                fontSize: 12,
                fontFamily: 'Circular Std',
                fontWeight: FontWeight.w500,
                height: 0.08,
              ),
            ),
            onLongPress: () {},
          ),
        ),
      ),
    );
  }
}
