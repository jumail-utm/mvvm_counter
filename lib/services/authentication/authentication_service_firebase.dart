import 'package:map_mvvm/map_mvvm.dart';

import 'authentication_service.dart';
import '../firebase_utils.dart';
import '../../models/user.dart'
    as AppUser; // To resolve conflict with firebase 'User' class

class AuthenticationServiceFirebase extends AuthenticationService {
  final _firebaseAuth = FirebaseAuthentication();
  FirebaseAuth get _auth => _firebaseAuth.auth;
  AppUser.User? _user;

  @override
  AppUser.User? get user {
    _user ??= transformData(_auth.currentUser);
    return _user;
  }

  // AppUser.User? get user => transformData(_auth.currentUser);
  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _user = transformData(credential.user);
    } on FirebaseAuthException catch (e) {
      throw Failure(400,
          message: e.toString(),
          location: 'AuthenticationServiceFirebase.signIn()');
    } catch (e) {
      throw Failure(401,
          message: e.toString(),
          location:
              'AuthenticationServiceFirebase.signIn() > other excecptions');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      _user = null;
    } on FirebaseAuthException catch (e) {
      throw Failure(500,
          message: e.toString(),
          location: 'AuthenticationServiceFirebase.signOut()');
    } catch (e) {
      throw Failure(501,
          message: e.toString(),
          location:
              'AuthenticationServiceFirebase.signOut() > other excecptions');
    }
  }

  @override
  Stream<User?>? get stream => _auth.authStateChanges();

  @override
  AppUser.User? transformData(firebaseUserData) {
    if (firebaseUserData == null) return null;

    return AppUser.User(
      username: firebaseUserData.email,
      email: firebaseUserData.email,
      name: firebaseUserData.displayName,
      uid: firebaseUserData.uid,
    );
  }
}
