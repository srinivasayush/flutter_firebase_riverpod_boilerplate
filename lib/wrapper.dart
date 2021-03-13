import 'package:flutter/material.dart';
import 'package:flutter_firebase_riverpod_boilerplate/screens/HomePage/homepage.dart';
import 'package:flutter_firebase_riverpod_boilerplate/screens/LoginPage/loginPage.dart';
import 'package:flutter_firebase_riverpod_boilerplate/services/auth.dart';
import 'package:flutter_firebase_riverpod_boilerplate/services/database.dart';
import 'package:flutter_firebase_riverpod_boilerplate/shared/authStateProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Wrapper extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return watch(authStateProvider).when(
      data: (user) {
        if (user == null) {
          return LoginPage();
        } else {
          return HomePage();
        }
      },
      loading: () => Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stackTrace) => Text(
        '$error',
      ),
    );
  }
}
