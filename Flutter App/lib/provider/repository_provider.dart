// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Repositories
import 'package:parkio/repository/space_repository.dart';
import 'package:parkio/repository/lot_repository.dart';
import 'package:parkio/repository/grid_repository.dart';
import 'package:parkio/repository/cell_repository.dart';

final spaceRepositoryProvider = Provider((ref) => SpaceRepository());
final lotRepositoryProvider = Provider((ref) => LotRepository());
final gridRepositoryProvider = Provider((ref) => GridRepository());
final cellRepositoryProvider = Provider((ref) => CellRepository());
