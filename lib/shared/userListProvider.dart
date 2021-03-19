import 'package:flutter_firebase_riverpod_boilerplate/models/userData.dart';
import 'package:flutter_firebase_riverpod_boilerplate/services/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userListProvider =
    FutureProvider.autoDispose<List<UserData>>((ref) async {
  final userDataList = await listUsers();
  ref.maintainState = true;
  return userDataList;
});
