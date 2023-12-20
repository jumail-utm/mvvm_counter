import 'package:flutter/material.dart';
import 'package:map_mvvm/view.dart';
import 'login.dart';

class LoginBody extends StatelessWidget {
  final LoginScreenState _state;

  LoginBody(this._state);

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<LoginViewmodel>(
      builder: (_, viewmodel) => Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome Back', style: TextStyle(fontSize: 35.0)),
              Text('Please sign in', style: TextStyle(fontSize: 20.0)),
              const SizedBox(height: 20),
              ...buildLoginTextFields(_state),
              if (viewmodel.hasFailure)
                Text(
                  viewmodel.failure.toString(),
                  style: TextStyle(color: Colors.red, fontSize: 20.0),
                ),
              const SizedBox(height: 10.0),
              LoginButtons(viewmodel: viewmodel, state: _state),
            ],
          ),
        ),
      ),
    );
  }
}
