import 'package:chatbox/data/models/mind_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CloudHome extends StatefulWidget {
  const CloudHome({super.key});

  @override
  State<CloudHome> createState() => _CloudHomeState();
}

class _CloudHomeState extends State<CloudHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HoemCloud"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        final db = FirebaseFirestore.instance;
        MindModel mind = MindModel(name: "Nodirbek".trim(), you: "salom",);
        await db.collection("minds").add(mind.toJson());
      }),
    );
  }
}
