import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final authStateChangesProvider = StreamProvider.autoDispose<User?>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);

  return firebaseAuth.authStateChanges();
});
final authName = StateProvider<String>((ref) {
  return '';
});
