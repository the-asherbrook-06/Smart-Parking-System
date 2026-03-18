// Packages
import 'package:flutter/material.dart';

// Models
import 'package:parkio/model/lot_model.dart';

// Widgets
import 'package:parkio/widgets/grid_view.dart';

class LotView extends StatelessWidget {
  const LotView({
    super.key,
    required this.lot,
    this.onCellTap,
  });

  final Lot lot;
  final void Function(int row, int col)? onCellTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                lot.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),

        Expanded(
          child: GridViewWidget(
            grid: lot.grid,
            onCellTap: onCellTap,
          ),
        ),
      ],
    );
  }
}