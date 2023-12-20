import 'package:flutter/material.dart';

import '../../ui_utils.dart';
import 'login_screen.dart';
import 'login_viewmodel.dart';

// This class is only for refactoring purposes.
// To declutter a bit the login_body.dart

class LoginButtons extends StatelessWidget {
  final LoginViewmodel viewmodel;
  final LoginScreenState state;
  const LoginButtons({required this.viewmodel, required this.state});
  static const divider = const SizedBox(width: 10.0);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text('Sign in'),
          onPressed: () => showSnackBarWhenError(
              context, () async => await state.onLogin(viewmodel)),
        ),
        divider,
        ElevatedButton(
          child: Text('Clear'),
          onPressed: () => state.onClear(viewmodel),
        ),
      ],
    );
  }
}
