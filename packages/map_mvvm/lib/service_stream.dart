import 'dart:async';

mixin ServiceStream<T> {
  // this getter is to be overidden, if the service supports stream such as in firestore
  Stream? get stream => null;

  // to be overridden by concrete class
  // This method is meant for normalizing of data, as each
  //  service has their own structure of data.
  //
  //  Example:  in Firebase authentication, user data received in a form of FirebaseUser,
  //            use the method transformData to convert FirebaseUser type to you own User model class

  dynamic transformData(data) => data;

  // subscriber to subscribe this stream
  StreamSubscription? listen({
    void Function(dynamic)? onData,
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    if (stream == null) return null;

    // in case the service also supports stream (like in firestore), create a listener to the stream
    return stream?.listen(
      (data) async {
        try {
          if (data != null) onData?.call(transformData(data));
        } catch (e) {
          if (onError == null) rethrow;
          onError(e);
        }
      },
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );
  }
}
