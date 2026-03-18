// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Repositories
import 'package:parkio/repository/space_repository.dart';

final spaceRepositoryProvider = Provider((ref) => SpaceRepository());
