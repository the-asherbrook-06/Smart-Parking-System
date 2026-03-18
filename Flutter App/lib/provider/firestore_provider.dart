// Packages
import 'package:parkio/repository/space_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final spaceRepositoryProvider = Provider((ref) => SpaceRepository());