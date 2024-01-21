
import 'package:cloud_firestore/cloud_firestore.dart';

class MindModel {
  String you;
  String name;
  String? docId;

  MindModel({
    required this.name,
    required this.you,
    this.docId ,
  });

  toJson() => {
        "you": you,
        "name": name,
        "docId": docId,
      };

  factory MindModel.fromJson(Map<String, dynamic> json) {
    return MindModel(
        name: json["name"], you: json["you"], docId: json["docId"],);
  }
}
