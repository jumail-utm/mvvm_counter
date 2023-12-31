import 'package:map_mvvm/map_mvvm.dart';

import 'authentication_service.dart';
import '../../models/user.dart';

class AuthenticationServiceMock extends AuthenticationService {
  final _mockAuthUsers = <User?>[
    User(
      username: 'mockuser1@gmail.com',
      password: 'pwd123',
      email: 'mockuser1@gmail.com',
      name: 'Mock User 1',
      uid: '0',
    ),
    User(
      username: 'mock2@gmail.com',
      password: 'pwd123',
      email: 'mock2@gmail.com',
      name: 'Mock User 2',
      uid: '1',
    ),
  ];

  User? _user;

  @override
  User? get user => _user;

  @override
  Future<void> signIn({required String email, required String password}) async {
    _user = _mockAuthUsers.firstWhere(
        (user) => (email == user?.username) && (password == user?.password),
        orElse: () => null);
    if (_user == null) {
      throw Failure(411,
          message: 'Invalid username or password!',
          location: 'AuthenticationServiceMock.signIn() > other excecptions');
    }
  }

  @override
  Future<void> signOut() async {
    _user = null;
  }
}
