import 'package:flutter/material.dart';
import 'package:flutter_firebase_riverpod_boilerplate/services/auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final authService = watch(authServiceProvider);
    return Scaffold(
      body: authService.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton.icon(
                    onPressed: () async {
                      final authService = context.read(authServiceProvider);
                      await authService.signInWithGoogle();
                    },
                    icon: Icon(
                      Icons.person,
                    ),
                    label: Text(
                      'Sign In',
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
