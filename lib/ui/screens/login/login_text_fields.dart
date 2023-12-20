import 'package:flutter/material.dart';

import 'login_screen.dart';
import '../../widgets/auth_text_field.dart';

// This function is only for refactoring purposes.
// To declutter a bit the login_body.dart

List<Widget> buildLoginTextFields(LoginScreenState state) => [
      AuthTextField(
          controller: state.usernameController,
          hint: 'Username',
          icon: Icons.people),
      AuthTextField(
        controller: state.passwordController,
        hint: 'Password',
        isObsecure: !state.showPassword,
        icon: Icons.lock,
        button: IconButton(
            icon: Icon(Icons.visibility),
            onPressed: () => state.showPassword = !state.showPassword),
      ),
    ];
