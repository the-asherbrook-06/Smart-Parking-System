// Packages
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

class AuthService {
  AuthService._();
  static final AuthService instance = AuthService._();

  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  GoogleSignInAccount? _currentUser;

  User? get currentUser => FirebaseAuth.instance.currentUser;

  Future<void> init({required String clientId, String? serverClientId}) async {
    await _googleSignIn.initialize(clientId: clientId, serverClientId: serverClientId);
    _googleSignIn.authenticationEvents.listen(_handleAuthEvent).onError(_handleAuthError);
  }

  void _handleAuthEvent(GoogleSignInAuthenticationEvent event) {
    if (event is GoogleSignInAuthenticationEventSignIn) {
      _currentUser = event.user;
    }
    if (event is GoogleSignInAuthenticationEventSignOut) {
      _currentUser = null;
    }
  }

  void _handleAuthError(Object error) {
    log("Google Auth Error: $error");
  }

  Future<User?> signIn() async {
    try {
      if (!await _googleSignIn.supportsAuthenticate()) return null;

      final googleUser = await _googleSignIn.authenticate();
      if (googleUser == null) return null;

      final googleAuth = googleUser.authentication;
      final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);
      final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      log("Email: ${userCredential.user?.email}");
      log("Username: ${userCredential.user?.displayName}");

      return userCredential.user;
    } catch (e) {
      log("Sign in error: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    _currentUser = null;
  }
}
