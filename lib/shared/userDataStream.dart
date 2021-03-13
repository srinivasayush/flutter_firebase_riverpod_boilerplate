import 'package:flutter_firebase_riverpod_boilerplate/models/userData.dart';
import 'package:flutter_firebase_riverpod_boilerplate/services/database.dart';
import 'package:flutter_firebase_riverpod_boilerplate/shared/authStateProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDataStreamProvider =
    StreamProvider.autoDispose<UserData?>((ref) async* {
  final user = await ref.watch(authStateProvider.last);
  if (user == null) {
    yield null;
  } else {
    final dataStream = userDataStream(user.uid);
    yield* dataStream;
  }
});
