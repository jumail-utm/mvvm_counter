import 'dart:async';

import 'package:map_mvvm/map_mvvm.dart';
import 'package:mvvm_counter/app/app.dart';

import '../../../app/service_locator/service_locator.dart';
import '../../../models/counter.dart';
import '../../../models/user.dart';

class HomeViewmodel extends Viewmodel {
  AuthenticationService get _authService => locator<AuthenticationService>();

  CounterService get _dataService => locator<CounterService>();

  User? get user => _authService.user;
  Counter _counter = Counter();
  StreamSubscription? _counterServiceStreamListener;
  bool get isListeningToCounterServiceStream =>
      _counterServiceStreamListener != null;

  @override
  void init() async {
    super.init();

    // notifyListenersOnFailure = false;

    await update(() async => _counter = await _dataService.readCounter());

    _counterServiceStreamListener = _dataService.listen(
      onData: (data) async =>
          await update(() async => _counter = (data as Counter).copyWith()),
      onError: (e) {
        catchError(Failure(401,
            message: e.toString(),
            location:
                'HomeViewmodel.onData.streamListener on other exceptions'));
      },
    );
  }

  Counter get counter => _counter;

  Future<void> incrementCounter() async => await update(
      () async => _counter = await _dataService.incrementCounter());

  Future<void> signOut() async {
    if (user == null) return; // sign Out only if has signed in before

    await update(() async => await _authService.signOut());
  }

  @override
  void dispose() {
    _counterServiceStreamListener?.cancel();
    _counterServiceStreamListener = null;
    super.dispose();
  }
}
