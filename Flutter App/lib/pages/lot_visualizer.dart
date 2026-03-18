// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

// Providers
import 'package:parkio/provider/space_provider.dart';

// Models
import 'package:parkio/model/grid_model.dart';

// Enums
import 'package:parkio/enums/cell_types.dart';

// Widgets
import 'package:parkio/widgets/grid_view.dart';

// Pages
import 'package:parkio/pages/lot_editor.dart';

class LotVisualizer extends ConsumerWidget {
  const LotVisualizer({super.key, required this.spaceId, required this.lotId});

  final String spaceId;
  final String lotId;

  Grid trimGrid(Grid grid) {
    final cells = grid.cells;

    if (cells.isEmpty) return grid;

    int top = 0;
    int bottom = cells.length - 1;
    int left = 0;
    int right = cells[0].length - 1;

    bool isRowEmpty(int r) => cells[r].every((c) => c.type == CellType.empty);
    bool isColEmpty(int c) => cells.every((row) => row[c].type == CellType.empty);

    while (top <= bottom && isRowEmpty(top)) top++;
    while (bottom >= top && isRowEmpty(bottom)) bottom--;
    while (left <= right && isColEmpty(left)) left++;
    while (right >= left && isColEmpty(right)) right--;

    if (top > bottom || left > right) {
      return const Grid(cells: []);
    }

    final trimmed = [
      for (int r = top; r <= bottom; r++) [for (int c = left; c <= right; c++) cells[r][c]],
    ];

    return Grid(cells: trimmed);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spaces = ref.watch(spacesProvider);

    final space = spaces.firstWhere((s) => s.id == spaceId);
    final lot = space.lots.firstWhere((l) => l.id == lotId);
    final trimmedGrid = trimGrid(lot.grid);

    return Scaffold(
      appBar: AppBar(
        title: Text(lot.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => LotEditor(spaceId: spaceId, lotId: lotId),
                ),
              );
            },
          ),
        ],
      ),
      body: GridViewWidget(grid: trimmedGrid),
    );
  }
}
