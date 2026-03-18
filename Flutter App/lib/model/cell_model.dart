// Enums
import 'package:parkio/enums/cell_status.dart';
import 'package:parkio/enums/cell_types.dart';
import 'package:parkio/enums/road_types.dart';

class Cell {
  final CellType type;
  final String? name;
  final CellStatus? status;
  final RoadType? roadType;

  const Cell({
    required this.type,
    this.name,
    this.status,
    this.roadType,
  });

  factory Cell.empty() {
    return const Cell(type: CellType.empty);
  }

  factory Cell.parking(String name) {
    return Cell(
      type: CellType.parking,
      name: name,
      status: CellStatus.unoccupied,
    );
  }

  factory Cell.road({RoadType roadType = RoadType.normal}) {
    return Cell(
      type: CellType.road,
      roadType: roadType,
    );
  }

  factory Cell.unusable() {
    return const Cell(type: CellType.unusable);
  }
}