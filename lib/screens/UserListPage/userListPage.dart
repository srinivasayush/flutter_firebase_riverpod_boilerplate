import 'package:flutter/material.dart';
import 'package:flutter_firebase_riverpod_boilerplate/shared/userListProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      body: watch(userListProvider).when<Widget>(
        data: (userDataList) {
          return ListView.builder(
            itemCount: userDataList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      userDataList[0].photoUrl!,
                    ),
                  ),
                  title: Text(
                    userDataList[0].displayName ?? '',
                  ),
                ),
              );
            },
          );
        },
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Text(
            '$error',
          ),
        ),
      ),
    );
  }
}
