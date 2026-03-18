// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

// Providers
import 'package:parkio/provider/space_provider.dart';

// Widgets
import 'package:parkio/widgets/grid_view.dart';

// Pages
import 'package:parkio/pages/lot_editor.dart';

class LotVisualizer extends ConsumerWidget {
  const LotVisualizer({super.key, required this.spaceId, required this.lotId});

  final String spaceId;
  final String lotId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lotsAsync = ref.watch(lotsProvider(spaceId));

    return lotsAsync.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text("Error: $e"))),
      data: (lots) {
        final lot = lots.firstWhere((l) => l.id == lotId);

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
          body: GridViewWidget(grid: lot.grid),
        );
      },
    );
  }
}
