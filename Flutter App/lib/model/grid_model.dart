// Models
import 'package:parkio/model/cell_model.dart';

class Grid {
  final List<List<Cell>> cells;

  const Grid({
    required this.cells,
  });

  int get rows => cells.length;
  int get cols => cells.isNotEmpty ? cells.first.length : 0;

  Cell getCell(int row, int col) {
    return cells[row][col];
  }

  Grid copyWith({List<List<Cell>>? cells}) {
    return Grid(
      cells: cells ?? this.cells,
    );
  }
}