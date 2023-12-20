import 'package:flutter/material.dart';
import 'package:map_mvvm/map_mvvm.dart';
import 'package:mvvm_counter/ui/screens/main/main_viewmodel.dart';
import 'package:mvvm_counter/ui/screens/home/home_screen.dart';
import 'package:mvvm_counter/ui/screens/login/login.dart';

class MainWrapper extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (_) => MainWrapper());
  const MainWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<MainViewmodel>(
      builder: (_, viewmodel) {
        if (viewmodel.user != null) return HomeScreen();
        return LoginScreen();
      },
    );
  }
}
