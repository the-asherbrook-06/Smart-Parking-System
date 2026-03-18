// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

// Providers
import 'package:parkio/provider/space_provider.dart';

// Pages
import 'package:parkio/pages/lot_viewer.dart';

// Widgets
import 'package:parkio/widgets/space_empty_state.dart';

class SpaceViewer extends ConsumerWidget {
  const SpaceViewer({super.key});

  void showCreateSpaceSheet(BuildContext context, WidgetRef ref) {
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
              const Text(
                "Create Space",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              TextField(
                autofocus: true,
                controller: controller,
                decoration: InputDecoration(
                  labelText: "Space Name",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  child: const Text("Create"),
                  onPressed: () {
                    final name = controller.text.trim();

                    if (name.isEmpty) return;

                    ref.read(spacesProvider.notifier).createSpace(name);

                    Navigator.pop(context);
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
    final spaces = ref.watch(spacesProvider);

    if (spaces.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text("Parkio Spaces"), centerTitle: false),
        body: EmptySpacesView(
          onCreateSpace: () {
            showCreateSpaceSheet(context, ref);
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Your Parkio Spaces"), centerTitle: false,),
      body: ListView.separated(
        itemCount: spaces.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final space = spaces[index];

          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.domain)),
            title: Text(space.name),
            subtitle: Text("${space.lots.length} lots"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => LotViewer(spaceId: space.id)));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCreateSpaceSheet(context, ref);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
