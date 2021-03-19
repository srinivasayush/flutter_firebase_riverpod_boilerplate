import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_riverpod_boilerplate/models/userData.dart';

final usersRef = FirebaseFirestore.instance.collection('users');

Future<void> addUser(User user) async {
  final documentSnapshot = await usersRef.doc(user.uid).get();
  if (!documentSnapshot.exists) {
    await usersRef.doc(user.uid).set(
      {
        'uid': user.uid,
        'photoURL': user.photoURL,
        'email': user.email,
        'displayName': user.displayName,
      },
    );
  }
}

Future<UserData> getUserData(String uid) async {
  final documentSnapshot = await usersRef.doc(uid).get();
  return UserData.fromMap(documentSnapshot.data()!);
}

Stream<UserData> userDataStream(String uid) {
  final docSnapshotStream = usersRef.doc(uid).snapshots();
  return docSnapshotStream.map(
    (ds) => UserData.fromMap(
      ds.data()!,
    ),
  );
}

List<UserData> _userDataListFromQuerySnapshot(QuerySnapshot qs) {
  return qs.docs.map((ds) {
    return UserData.fromMap(ds.data()!);
  }).toList();
}

Future<List<UserData>> listUsers() async {
  final usersQuerySnapshot = await usersRef.get();
  final userDataList = _userDataListFromQuerySnapshot(usersQuerySnapshot);
  return userDataList;
}
