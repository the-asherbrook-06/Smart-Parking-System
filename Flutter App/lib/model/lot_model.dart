// Models
import 'package:parkio/model/grid_model.dart';

class Lot {
  final String id;
  final String name;
  final Grid grid;

  Lot({
    required this.id,
    required this.name,
    required this.grid,
  });

  Lot copyWith({
    String? id,
    String? name,
    Grid? grid,
  }) {
    return Lot(
      id: id ?? this.id,
      name: name ?? this.name,
      grid: grid ?? this.grid,
    );
  }
}