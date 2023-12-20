import 'dart:async';
import 'package:map_mvvm/viewmodel.dart';

import '../../../app/service_locator/service_locator.dart';
import '../../../models/user.dart';

class LoginViewmodel extends Viewmodel {
  AuthenticationService get _authService => locator<AuthenticationService>();

  StreamSubscription? _authServiceStreamListener;
  bool get isListeningToAuthServiceStream => _authServiceStreamListener != null;

  @override
  void init() async {
    super.init();
    notifyListenersOnFailure = true;

    _authServiceStreamListener = _authService.listen(
      onData: (user) async => await update(() async {}),
      onError: (e) => catchError(e),
    );
  }

  User? get user => _authService.user;

  Future<void> signIn({required String email, required String password}) async {
    if (user != null) return; // sign in only if not signed in

    // If the auth service also provides stream (like in Firebase)
    // observe the response only from the stream. Do not use the "response"
    // from the Future. Otherwise, there will duplicate results.
    // That means, if stream is enabled, do not use "notifyListeners()".
    // Call to update will call to 'notifyListeners()'

    if (isListeningToAuthServiceStream && !notifyListenersOnFailure) {
      await _authService.signIn(email: email, password: password);
    } else {
      await update(() async =>
          await _authService.signIn(email: email, password: password));
    }
  }

  @override
  void dispose() {
    _authServiceStreamListener?.cancel();
    _authServiceStreamListener = null;
    super.dispose();
  }
}
