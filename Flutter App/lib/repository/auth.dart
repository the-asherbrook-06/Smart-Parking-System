// // Packages
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:developer';

// class AuthService {
//   AuthService._();
//   static final AuthService instance = AuthService._();

//   final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

//   GoogleSignInAccount? _currentUser;

//   User? get currentUser => FirebaseAuth.instance.currentUser;

//   Future<void> init({required String clientId, String? serverClientId}) async {
//     await _googleSignIn.initialize(
//       clientId:
//           "1064399863768-mqa4mkh6i062ngmsb084i3bbgo85rtja.apps.googleusercontent.com",
//       serverClientId:
//           "1064399863768-mqa4mkh6i062ngmsb084i3bbgo85rtja.apps.googleusercontent.com",
//     );
//     _googleSignIn.authenticationEvents
//         .listen(_handleAuthEvent)
//         .onError(_handleAuthError);
//   }

//   void _handleAuthEvent(GoogleSignInAuthenticationEvent event) {
//     if (event is GoogleSignInAuthenticationEventSignIn) {
//       _currentUser = event.user;
//     }
//     if (event is GoogleSignInAuthenticationEventSignOut) {
//       _currentUser = null;
//     }
//   }

//   void _handleAuthError(Object error) {
//     log("Google Auth Error: $error");
//   }

//   Future<User?> signIn() async {
//     try {
//       if (!await _googleSignIn.supportsAuthenticate()) return null;

//       final googleUser = await _googleSignIn.authenticate();
//       if (googleUser == null) return null;

//       final googleAuth = googleUser.authentication;
//       final credential = GoogleAuthProvider.credential(
//         idToken: googleAuth.idToken,
//       );
//       final userCredential = await FirebaseAuth.instance.signInWithCredential(
//         credential,
//       );

//       log("Email: ${userCredential.user?.email}");
//       log("Username: ${userCredential.user?.displayName}");

//       return userCredential.user;
//     } catch (e) {
//       log("Sign in error: $e");
//       return null;
//     }
//   }

//   Future<void> signOut() async {
//     await _googleSignIn.signOut();
//     _currentUser = null;
//   }
// }
// Packages
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

class AuthService {
  AuthService._();
  static final AuthService instance = AuthService._();

  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  GoogleSignInAccount? _currentUser;
  bool _isInitialized = false;

  User? get currentUser => FirebaseAuth.instance.currentUser;

  // 🔥 Your Web Client ID (keep here directly)
  static const String _clientId =
      "1064399863768-mqa4mkh6i062ngmsb084i3bbgo85rtja.apps.googleusercontent.com";

  // ✅ Internal init (auto-called)
  Future<void> _init() async {
    if (_isInitialized) return;

    await _googleSignIn.initialize(
      clientId: _clientId,
      serverClientId: _clientId,
    );

    _googleSignIn.authenticationEvents
        .listen(_handleAuthEvent)
        .onError(_handleAuthError);

    _isInitialized = true;
  }

  // ✅ Handle auth events
  void _handleAuthEvent(GoogleSignInAuthenticationEvent event) {
    if (event is GoogleSignInAuthenticationEventSignIn) {
      _currentUser = event.user;
    } else if (event is GoogleSignInAuthenticationEventSignOut) {
      _currentUser = null;
    }
  }

  // ✅ Handle errors
  void _handleAuthError(Object error) {
    log("Google Auth Error: $error");
  }

  // ✅ Sign in (auto initializes)
  Future<User?> signIn() async {
    try {
      await _init(); // 🔥 auto init here

      if (!await _googleSignIn.supportsAuthenticate()) {
        log("Google Sign-In not supported");
        return null;
      }

      final googleUser = await _googleSignIn.authenticate();
      if (googleUser == null) {
        log("User cancelled sign-in");
        return null;
      }

      final googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        // accessToken: googleAuth.accessToken,
      );

      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      log("Email: ${userCredential.user?.email}");
      log("Username: ${userCredential.user?.displayName}");

      return userCredential.user;
    } catch (e) {
      log("Sign in error: $e");
      return null;
    }
  }

  // ✅ Sign out
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
    _currentUser = null;
  }
}