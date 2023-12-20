// Helper classes and functions for firebase related operations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

export 'package:firebase_core/firebase_core.dart';
export 'package:cloud_firestore/cloud_firestore.dart';
export 'package:firebase_auth/firebase_auth.dart';

class Firestore {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // path is a full path, e.g,
  // '$collectionId/$documentId'
  CollectionReference<Map<String, dynamic>> collection(String path) =>
      _firestore.collection(path);
  DocumentReference<Map<String, dynamic>> document(String path) =>
      _firestore.doc(path);
}

class FirebaseAuthentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseAuth get auth => _firebaseAuth;
}
