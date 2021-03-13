import 'package:meta/meta.dart';

class UserData {
  UserData({
    @required this.uid,
    @required this.photoUrl,
    @required this.email,
    @required this.displayName,
  });

  String? uid;
  String? photoUrl;
  String? email;
  String? displayName;

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
        uid: json["uid"],
        photoUrl: json["photoURL"],
        email: json["email"],
        displayName: json["displayName"],
      );

  Map<String, dynamic> toMap() => {
        "uid": uid,
        "photoURL": photoUrl,
        "email": email,
        "displayName": displayName,
      };
}
