// Models
import 'package:parkio/model/cell_model.dart';

class Grid {
  final List<List<Cell>> cells;

  const Grid({required this.cells});

  int get rows => cells.length;
  int get cols => cells.isNotEmpty ? cells.first.length : 0;

  Cell getCell(int row, int col) {
    return cells[row][col];
  }

  Grid copyWith({List<List<Cell>>? cells}) {
    return Grid(cells: cells ?? this.cells);
  }

  Map<String, dynamic> toJson() {
    return {
      "rows": rows,
      "cols": cols,
      "cells": [
        for (int r = 0; r < rows; r++)
          for (int c = 0; c < cols; c++) {"row": r, "col": c, ...cells[r][c].toJson()},
      ],
    };
  }

  factory Grid.fromJson(Map<String, dynamic> json) {
    final rows = json["rows"];
    final cols = json["cols"];
    final flatCells = json["cells"] as List;

    final grid = List.generate(rows, (_) => List.generate(cols, (_) => Cell.empty()));

    for (final item in flatCells) {
      final r = item["row"];
      final c = item["col"];

      grid[r][c] = Cell.fromJson(item);
    }

    return Grid(cells: grid);
  }
}
