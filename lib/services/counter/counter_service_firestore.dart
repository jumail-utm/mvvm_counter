import 'package:map_mvvm/failure.dart';

import '../firebase_utils.dart';
import '../../app/service_locator/service_locator.dart';
import '../../models/counter.dart';
// import '../../app/failures.dart';

class CounterServiceFirestore extends CounterService {
  final _firestore = Firestore();
  // static const _userId = 'user1001';
  AuthenticationService get _authService => locator<AuthenticationService>();
  String? get _userId => _authService.user?.uid;

  DocumentReference<Map<String, dynamic>> get _document =>
      _firestore.document('counters/$_userId');

  @override
  Future<Counter> readCounter() async {
    try {
      final doc = await _document.get();
      return Counter.fromJson(doc.data()!);
    } on FirebaseException catch (e) {
      // throw Failures.cannotRead;
      throw Failure(100,
          message: e.toString(),
          location:
              'CounterServiceFireStore.readCounter() on FirebaseException');
    } catch (e) {
      throw Failure(101,
          message: e.toString(),
          location: 'CounterServiceFireStore.readCounter() on other exception');
    }
  }

  @override
  Future<Counter> writeCounter(Counter counter) async {
    try {
      await _document.set(counter.toJson());
      return counter.copyWith();
    } on FirebaseException catch (e) {
      // throw Failures.cannotWrite;
      throw Failure(200,
          message: e.toString(),
          location:
              'CounterServiceFireStore.writeCounter() on FirebaseException');
    } catch (e) {
      throw Failure(201,
          message: e.toString(),
          location:
              'CounterServiceFireStore.writeCounter() on other exceptions');
    }
  }

  @override
  Stream? get stream => _document.snapshots();

  @override
  Counter? transformData(data) {
    try {
      final doc = data.data();
      final counter = Counter.fromJson(doc);
      return counter;
    } on FirebaseException catch (e) {
      throw Failure(300,
          message: e.toString(),
          location:
              'CounterServiceFireStore.transformData() on FirebaseException');
    } catch (e) {
      throw Failure(301,
          message: e.toString(),
          location:
              'CounterServiceFireStore.transformData() on other exception');
    }
  }
}
