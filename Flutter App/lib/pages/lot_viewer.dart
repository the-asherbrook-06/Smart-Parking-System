// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

// Models
import 'package:parkio/model/grid_model.dart';
import 'package:parkio/model/cell_model.dart';
import 'package:parkio/model/lot_model.dart';

// Providers
import 'package:parkio/provider/repository_provider.dart';
import 'package:parkio/provider/space_provider.dart';

// Pages
import 'package:parkio/pages/lot_visualizer.dart';
import 'package:parkio/pages/lot_editor.dart';

// Widgets
import 'package:parkio/widgets/lots_empty_state.dart';

class LotViewer extends ConsumerWidget {
  const LotViewer({super.key, required this.spaceId});

  final String spaceId;

  Grid createStarterGrid() {
    return Grid(cells: List.generate(3, (_) => List.generate(3, (_) => Cell.empty())));
  }

  void showCreateLotSheet(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.fromLTRB(24, 24, 24, MediaQuery.of(context).viewInsets.bottom + 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Create Lot", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

              const SizedBox(height: 16),

              TextField(
                controller: controller,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Lot Name",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  child: const Text("Create"),
                  onPressed: () async {
                    final name = controller.text.trim();
                    if (name.isEmpty) return;

                    final lot = Lot(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      name: name,
                      grid: createStarterGrid(),
                    );

                    await ref.read(spaceRepositoryProvider).addLot(spaceId, lot);

                    Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LotEditor(spaceId: spaceId, lotId: lot.id),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lotsAsync = ref.watch(lotsProvider(spaceId));

    return lotsAsync.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text("Error: $e"))),
      data: (lots) {
        if (lots.isEmpty) {
          return Scaffold(
            appBar: AppBar(title: const Text("Lots")),
            body: EmptyLotsView(onCreateLot: () => showCreateLotSheet(context, ref)),
          );
        }

        return Scaffold(
          appBar: AppBar(title: const Text("Lots")),

          body: ListView.builder(
            itemCount: lots.length,
            itemBuilder: (context, index) {
              final lot = lots[index];

              return ListTile(
                leading: const Icon(Icons.local_parking),
                title: Text(lot.name),
                subtitle: Text("${lot.grid.rows} × ${lot.grid.cols}"),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LotVisualizer(spaceId: spaceId, lotId: lot.id),
                    ),
                  );
                },
              );
            },
          ),

          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => showCreateLotSheet(context, ref),
            icon: const Icon(Icons.add),
            label: const Text("New Lot"),
          ),
        );
      },
    );
  }
}
