import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String getterName;
   String? senderName;
  String getterUid;
  Timestamp dateTime;
  String message;
  String senderUid;
  String uid;

  MessageModel({
    required this.senderUid,
    required this.message,
    required this.getterName,
    required this.getterUid,
   required this.senderName,
    required this.dateTime,
    required this.uid,
  });

  toJson() => {
        "getterName": getterName,
        "senderName": senderName,
        "getterUid": getterUid,
        "dateTime": dateTime,
        "message": message,
        "senderUid": senderUid,
        "uid":uid,
      };

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      senderUid: json["senderUid"],
      message: json["message"],
      dateTime: json["dateTime"],
      getterUid: json['getterUid'],
      senderName: json["senderName"],
      getterName: json["getterName"],
      uid: json["uid"],
    );
  }
}
