// Packages
import 'package:flutter/material.dart';

// Models
import 'package:parkio/model/space_model.dart';

class SpacesList extends StatelessWidget {
  const SpacesList({
    super.key,
    required this.spaces,
    required this.onSelectSpace,
  });

  final List<Space> spaces;
  final void Function(Space space) onSelectSpace;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: spaces.length,
      separatorBuilder: (_, _) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final space = spaces[index];

        return ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          tileColor: Theme.of(context).colorScheme.surfaceContainer,
          title: Text(space.name),
          subtitle: Text("${space.lots.length} lots"),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => onSelectSpace(space),
        );
      },
    );
  }
}