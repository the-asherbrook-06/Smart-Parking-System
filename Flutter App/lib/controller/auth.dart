// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Repositories
import 'package:parkio/repository/auth.dart';

final authControllerProvider = AsyncNotifierProvider<AuthController, User?>(AuthController.new);

class AuthController extends AsyncNotifier<User?> {
  late final AuthService _auth;

  @override
  Future<User?> build() async {
    _auth = AuthService.instance;
    return _auth.currentUser;
  }

  Future<void> signIn() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      return await _auth.signIn();
    });
  }

  Future<void> signOut() async {
    await _auth.signOut();
    state = const AsyncData(null);
  }
}
