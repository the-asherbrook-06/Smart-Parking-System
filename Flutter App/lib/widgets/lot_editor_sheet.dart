// Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Providers
import 'package:parkio/provider/lot_editor_provider.dart';

// Models
import 'package:parkio/model/cell_model.dart';

// Enums
import 'package:parkio/enums/cell_types.dart';
import 'package:parkio/enums/road_types.dart';
import 'package:parkio/enums/cell_status.dart';

class LotEditorSheet extends ConsumerWidget {
  const LotEditorSheet({
    super.key,
    required this.row,
    required this.col,
    required this.cell,
  });

  final int row;
  final int col;
  final Cell cell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(lotEditorProvider.notifier);

    final isNewCell = cell.type == CellType.empty;

    void updateCell(Cell newCell) {
      notifier.updateCell(row, col, newCell);
      Navigator.pop(context);
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isNewCell ? "Add Cell" : "Edit Cell",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            ListTile(
              leading: const Icon(Icons.local_parking),
              title: const Text("Parking Spot"),
              onTap: () {
                updateCell(
                  Cell(
                    type: CellType.parking,
                    name: "P${row}_$col",
                    status: CellStatus.unoccupied,
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.alt_route),
              title: const Text("Road"),
              onTap: () {
                updateCell(
                  const Cell(type: CellType.road),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.block),
              title: const Text("Unusable"),
              onTap: () {
                updateCell(
                  const Cell(type: CellType.unusable),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.login),
              title: const Text("Entry Road"),
              onTap: () {
                updateCell(
                  const Cell(
                    type: CellType.road,
                    roadType: RoadType.entry,
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Exit Road"),
              onTap: () {
                updateCell(
                  const Cell(
                    type: CellType.road,
                    roadType: RoadType.exit,
                  ),
                );
              },
            ),

            if (!isNewCell) ...[
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  updateCell(
                    const Cell(type: CellType.empty),
                  );
                },
                child: const Text("Clear Cell"),
              ),
            ],
          ],
        ),
      ),
    );
  }
}