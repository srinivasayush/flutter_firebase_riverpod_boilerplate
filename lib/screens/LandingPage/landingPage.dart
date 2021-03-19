import 'package:flutter/material.dart';
import 'package:flutter_firebase_riverpod_boilerplate/services/auth.dart';
import 'package:flutter_firebase_riverpod_boilerplate/shared/userDataStream.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LandingPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return watch(userDataStreamProvider).when<Widget>(
      data: (userData) {
        if (userData == null) {
          return Container();
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(
                  userData.photoUrl!,
                ),
              ),
              Text(
                userData.displayName ?? '',
              ),
              ElevatedButton(
                onPressed: () async {
                  final authService = context.read(authServiceProvider);
                  await authService.signOut();
                },
                child: Text(
                  'Log out',
                ),
              )
            ],
          ),
        );
      },
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) {
        return Center(
          child: Text(
            'Something went wrong: $error',
          ),
        );
      },
    );
  }
}
