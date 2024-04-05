import 'package:flutter/material.dart';
import 'package:zoom_clone/services/auth_methods.dart';
import 'package:zoom_clone/widgets/my_drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout()
  {
    final _authMethods= AuthMethods();
    _authMethods.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.comment_bank,
              size: 90,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          MyDrawerTile(
            text: 'H O M E',
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          MyDrawerTile(
            text: 'M E E T I N G S',
            icon: Icons.lock_clock,
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/meeting-history');
            },
          ),
          MyDrawerTile(
            text: 'S E T T I N G S',
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/settings');
            },
          ),
          // const Spacer(),
          // MyDrawerTile(
          //   text: 'L O G O U T',
          //   icon: Icons.logout,
          //   onTap: () {
          //     logout();
          //     Navigator.pop(context);
          //   },
          // ),
          // const SizedBox(height: 20),
        ],
      ),
    );
  }
}
