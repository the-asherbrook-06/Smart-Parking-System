// Packages
import 'package:dotted_border/dotted_border.dart';
import 'package:hugeicons_pro/hugeicons.dart';
import 'package:flutter/material.dart';

// Models
import 'package:parkio/model/cell_model.dart';

// Enums
import 'package:parkio/enums/cell_types.dart';
import 'package:parkio/enums/road_types.dart';
import 'package:parkio/enums/cell_status.dart';

class CellView extends StatelessWidget {
  const CellView({super.key, required this.cell});

  final Cell cell;

  Color _getColor(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    switch (cell.type) {
      case CellType.parking:
        return cell.status == CellStatus.occupied ? scheme.error : scheme.primary;

      case CellType.road:
        if (cell.roadType == RoadType.entry) {
          return Colors.blue.withAlpha(40);
        }
        if (cell.roadType == RoadType.exit) {
          return Colors.amber.withAlpha(50);
        }
        return scheme.surfaceContainer;

      case CellType.unusable:
        return scheme.surface;

      case CellType.empty:
        return scheme.surface;
    }
  }

  Widget _buildEmptyCell(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(4),
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          radius: const Radius.circular(8),
          dashPattern: const [1, 5],
          color: scheme.onSurfaceVariant,
        ),
        child: Center(child: Icon(HugeIconsStroke.add01, color: scheme.onSurfaceVariant)),
      ),
    );
  }

  Widget _buildCell(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      margin: cell.type != CellType.road ? const EdgeInsets.all(4) : EdgeInsets.zero,
      decoration: BoxDecoration(
        color: _getColor(context),
        borderRadius: cell.type == CellType.road ? BorderRadius.zero : BorderRadius.circular(8),
      ),
      child: Center(
        child: cell.type == CellType.road
            ? null
            : Text(cell.name ?? "", style: TextStyle(color: scheme.onPrimary)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (cell.type == CellType.empty) {
      return _buildEmptyCell(context);
    }

    return _buildCell(context);
  }
}
