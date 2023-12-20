import 'package:flutter/material.dart';

import '../../../app/routes.dart';
import 'login.dart';

class LoginScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => LoginScreen());

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool _showPassword = false;
  get showPassword => _showPassword;
  set showPassword(value) => setState(() => _showPassword = value);

  String get username => usernameController.text;
  String get password => passwordController.text;

  Future<void> onLogin(LoginViewmodel viewmodel) async {
    await viewmodel.signIn(email: username, password: password);
    final _user = viewmodel.user;
    if (_user != null) Navigator.pushReplacementNamed(context, Routes.home);
  }

  void onClear(LoginViewmodel viewmodel) async {
    usernameController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LoginAppBar(),
      body: LoginBody(this),
    );
  }
}
