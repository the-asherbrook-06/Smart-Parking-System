// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Repositories
import 'package:parkio/repository/auth.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService.instance;
});