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

  // 🔥 Trim empty edges (editor padding remover)
  Grid trimGrid(Grid grid) {
    final cells = grid.cells;

    if (cells.isEmpty || cells.first.isEmpty) return grid;

    int top = 0;
    int bottom = cells.length - 1;
    int left = 0;
    int right = cells[0].length - 1;

    bool isRowEmpty(int r) => cells[r].every(
          (c) => c.type == CellType.empty || c.type == CellType.unusable,
        );

    bool isColEmpty(int c) => cells.every(
          (row) => row[c].type == CellType.empty || row[c].type == CellType.unusable,
        );

    // Trim top
    while (top <= bottom && isRowEmpty(top)) top++;

    // Trim bottom
    while (bottom >= top && isRowEmpty(bottom)) bottom--;

    // Trim left
    while (left <= right && isColEmpty(left)) left++;

    // Trim right
    while (right >= left && isColEmpty(right)) right--;

    // If everything is empty
    if (top > bottom || left > right) {
      return const Grid(cells: []);
    }

    final trimmed = [
      for (int r = top; r <= bottom; r++)
        [for (int c = left; c <= right; c++) cells[r][c]],
    ];

    return Grid(cells: trimmed);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lotsAsync = ref.watch(lotsProvider(spaceId));

    return lotsAsync.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),

      error: (e, _) => Scaffold(
        body: Center(child: Text("Error: $e")),
      ),

      data: (lots) {
        final lot = lots.firstWhere((l) => l.id == lotId);

        // 🔥 Apply trimming here
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
                      builder: (_) => LotEditor(
                        spaceId: spaceId,
                        lotId: lotId,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),

          body: trimmedGrid.cells.isEmpty
              ? const Center(child: Text("No layout created yet"))
              : GridViewWidget(grid: trimmedGrid),
        );
      },
    );
  }
}