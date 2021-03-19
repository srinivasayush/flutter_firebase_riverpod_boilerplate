import 'package:flutter/material.dart';
import 'package:flutter_firebase_riverpod_boilerplate/screens/LandingPage/landingpage.dart';
import 'package:flutter_firebase_riverpod_boilerplate/screens/UserListPage/userListPage.dart';
import 'package:flutter_firebase_riverpod_boilerplate/services/auth.dart';
import 'package:flutter_firebase_riverpod_boilerplate/shared/userDataStream.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavigationIndexStateProvider =
    StateProvider.autoDispose<int>((ref) {
  return 0;
});

class HomePage extends ConsumerWidget {
  List<Widget> get bodyWidgets {
    return [
      LandingPage(),
      UserListPage(),
    ];
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final bottomNavigationIndex =
        watch(bottomNavigationIndexStateProvider).state;
    return Scaffold(
      body: bodyWidgets[bottomNavigationIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        currentIndex: bottomNavigationIndex,
        onTap: (index) {
          context.read(bottomNavigationIndexStateProvider).state = index;
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Users',
          ),
        ],
      ),
    );
  }
}
