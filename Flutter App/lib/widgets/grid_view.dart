// Packages
import 'package:flutter/material.dart';

// Models
import 'package:parkio/model/grid_model.dart';

// Widgets
import 'package:parkio/widgets/cell_view.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key, required this.grid, this.onCellTap});

  final Grid grid;
  final void Function(int row, int col)? onCellTap;

  static const double cellSize = 120;

  @override
  Widget build(BuildContext context) {
    final cells = grid.cells;

    if (cells.isEmpty || cells.first.isEmpty) {
      return const SizedBox.shrink();
    }

    return Scrollbar(
      thumbVisibility: true,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(cells.length, (rowIndex) {
              final row = cells[rowIndex];

              return Row(
                children: List.generate(row.length, (colIndex) {
                  final cell = row[colIndex];

                  return GestureDetector(
                    onTap: () => onCellTap?.call(rowIndex, colIndex),
                    child: SizedBox(
                      width: cellSize,
                      height: cellSize,
                      child: CellView(cell: cell),
                    ),
                  );
                }),
              );
            }),
          ),
        ),
      ),
    );
  }
}
