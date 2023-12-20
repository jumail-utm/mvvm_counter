import 'package:flutter/material.dart';
import 'package:map_mvvm/map_mvvm.dart';

import '../../../app/routes.dart';
import 'home_viewmodel.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(50);

  Future<void> onLogout(BuildContext context, HomeViewmodel viewmodel) async {
    await viewmodel.signOut();
    final _user = viewmodel.user;
    if (_user == null) Navigator.pushReplacementNamed(context, Routes.main);
  }

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<HomeViewmodel>(
      builder: (_, viewmodel) => AppBar(
        title: Text('You signed in as ${viewmodel.user?.username}'),
        actions: [
          IconButton(
              onPressed: () => onLogout(context, viewmodel),
              icon: Icon(
                Icons.logout,
                // color: Colors.red,
                size: 40,
              )),
          SizedBox(
            width: 50,
          )
        ],
      ),
    );
  }
}
