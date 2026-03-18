class CellRepository {
  Map<String, dynamic>? getCell(
    List<List<Map<String, dynamic>>> grid,
    int row,
    int col,
  ) {
    if (row < grid.length && col < grid[row].length) {
      return grid[row][col];
    }
    return null;
  }

  void updateCell(
    List<List<Map<String, dynamic>>> grid,
    int row,
    int col,
    Map<String, dynamic> newCell,
  ) {
    if (row < grid.length && col < grid[row].length) {
      grid[row][col] = newCell;
    }
  }

  void clearCell(
    List<List<Map<String, dynamic>>> grid,
    int row,
    int col,
  ) {
    if (row < grid.length && col < grid[row].length) {
      grid[row][col] = {"type": "N"};
    }
  }
}