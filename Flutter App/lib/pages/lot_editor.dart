// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

// Widgets
import 'package:parkio/widgets/lot_editor_sheet.dart';
import 'package:parkio/widgets/grid_view.dart';

// Providers
import 'package:parkio/provider/lot_editor_provider.dart';
import 'package:parkio/provider/space_provider.dart';

class LotEditor extends ConsumerStatefulWidget {
  const LotEditor({
    super.key,
    required this.spaceId,
    required this.lotId,
  });

  final String spaceId;
  final String lotId;

  @override
  ConsumerState<LotEditor> createState() => _LotEditorState();
}

class _LotEditorState extends ConsumerState<LotEditor> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final spaces = ref.read(spacesProvider);
      final space = spaces.firstWhere((s) => s.id == widget.spaceId);
      final lot = space.lots.firstWhere((l) => l.id == widget.lotId);

      ref.read(lotEditorProvider.notifier).loadGrid(lot.grid);
    });
  }

  @override
  Widget build(BuildContext context) {
    final editor = ref.watch(lotEditorProvider);
    final spaces = ref.watch(spacesProvider);

    final space = spaces.firstWhere((s) => s.id == widget.spaceId);
    final lot = space.lots.firstWhere((l) => l.id == widget.lotId);

    return Scaffold(
      appBar: AppBar(title: Text(lot.name)),

      body: GridViewWidget(
        grid: editor.grid,
        onCellTap: (row, col) {
          final cell = editor.grid.cells[row][col];

          showModalBottomSheet(
            context: context,
            builder: (_) => LotEditorSheet(
              row: row,
              col: col,
              cell: cell,
            ),
          );
        },
      ),

      floatingActionButton: editor.hasChanges
          ? FloatingActionButton.extended(
              icon: const Icon(Icons.save),
              label: const Text("Save Layout"),
              onPressed: () {
                final updatedLot = lot.copyWith(grid: editor.grid);

                ref
                    .read(spacesProvider.notifier)
                    .updateLot(widget.spaceId, updatedLot);

                Navigator.pop(context);
              },
            )
          : null,
    );
  }
}