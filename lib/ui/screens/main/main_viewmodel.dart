import 'package:map_mvvm/viewmodel.dart';

import '../../../app/service_locator/service_locator.dart';
import '../../../models/user.dart' as AppUser;

class MainViewmodel extends Viewmodel {
  AuthenticationService get _authService =>
      locator<AuthenticationService>(); // polymorphism = overriden

  AppUser.User? get user => _authService.user;
}
