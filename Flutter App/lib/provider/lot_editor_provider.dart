// Packages
import 'package:flutter_riverpod/legacy.dart';

// Models
import 'package:parkio/model/grid_model.dart';
import 'package:parkio/model/cell_model.dart';

// Enums
import 'package:parkio/enums/cell_types.dart';

class LotEditorState {
  final Grid grid;
  final bool hasChanges;

  const LotEditorState({required this.grid, required this.hasChanges});

  LotEditorState copyWith({Grid? grid, bool? hasChanges}) {
    return LotEditorState(grid: grid ?? this.grid, hasChanges: hasChanges ?? this.hasChanges);
  }
}

class LotEditorNotifier extends StateNotifier<LotEditorState> {
  LotEditorNotifier() : super(const LotEditorState(grid: Grid(cells: []), hasChanges: false));

  void loadGrid(Grid grid) {
    state = state.copyWith(grid: grid);
  }

  void updateCell(int row, int col, Cell cell) {
    var cells = state.grid.cells.map((r) => [...r]).toList();

    cells[row][col] = cell;
    if (cell.type != CellType.empty) {
      cells = _expandIfNeeded(cells, row, col);
    }

    cells = _trimGrid(cells);
    state = state.copyWith(grid: Grid(cells: cells), hasChanges: true);
  }

  List<List<Cell>> _expandIfNeeded(List<List<Cell>> cells, int row, int col) {
    int rows = cells.length;
    int cols = cells[0].length;

    // Top
    if (row == 0) {
      cells.insert(0, List.generate(cols, (_) => Cell.empty()));
      row++;
    }

    // Bottom
    if (row == rows - 1) {
      cells.add(List.generate(cols, (_) => Cell.empty()));
    }

    // Left
    if (col == 0) {
      for (var r in cells) {
        r.insert(0, Cell.empty());
      }
      col++;
    }

    // Right
    if (col == cols - 1) {
      for (var r in cells) {
        r.add(Cell.empty());
      }
    }

    return cells;
  }

  List<List<Cell>> _fillInnerVoids(List<List<Cell>> cells) {
    int rows = cells.length;
    int cols = cells[0].length;

    bool rowEmpty(int r) => cells[r].every((c) => c.type == CellType.empty);

    bool colEmpty(int c) => cells.every((row) => row[c].type == CellType.empty);

    for (int r = 1; r < rows - 1; r++) {
      if (rowEmpty(r)) {
        for (int c = 1; c < cols - 1; c++) {
          cells[r][c] = const Cell(type: CellType.unusable);
        }
      }
    }

    for (int c = 1; c < cols - 1; c++) {
      if (colEmpty(c)) {
        for (int r = 1; r < rows - 1; r++) {
          cells[r][c] = const Cell(type: CellType.unusable);
        }
      }
    }

    return cells;
  }

  List<List<Cell>> _trimGrid(List<List<Cell>> cells) {
    if (cells.isEmpty) return cells;

    int top = 0;
    int bottom = cells.length - 1;
    int left = 0;
    int right = cells[0].length - 1;

    bool rowEmpty(int r) => cells[r].every((c) => c.type == CellType.empty);
    bool colEmpty(int c) => cells.every((row) => row[c].type == CellType.empty);

    while (top <= bottom && rowEmpty(top)) top++;
    while (bottom >= top && rowEmpty(bottom)) bottom--;
    while (left <= right && colEmpty(left)) left++;
    while (right >= left && colEmpty(right)) right--;

    if (top > bottom || left > right) {
      return List.generate(3, (_) => List.generate(3, (_) => Cell.empty()));
    }

    top = (top - 1).clamp(0, cells.length - 1);
    bottom = (bottom + 1).clamp(0, cells.length - 1);
    left = (left - 1).clamp(0, cells[0].length - 1);
    right = (right + 1).clamp(0, cells[0].length - 1);

    final trimmed = [
      for (int r = top; r <= bottom; r++) [for (int c = left; c <= right; c++) cells[r][c]],
    ];

    int minRows = trimmed.length < 3 ? 3 : trimmed.length;
    int minCols = trimmed[0].length < 3 ? 3 : trimmed[0].length;

    final normalized = _fillInnerVoids(trimmed);

    return List.generate(
      minRows,
      (r) => List.generate(minCols, (c) {
        if (r < normalized.length && c < normalized[0].length) {
          return normalized[r][c];
        }
        return Cell.empty();
      }),
    );
  }
}

final lotEditorProvider = StateNotifierProvider<LotEditorNotifier, LotEditorState>(
  (ref) => LotEditorNotifier(),
);
