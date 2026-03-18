// Packages
import 'package:flutter/material.dart';

class EmptyLotsView extends StatelessWidget {
  const EmptyLotsView({
    super.key,
    required this.onCreateLot,
  });

  final VoidCallback onCreateLot;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.local_parking_outlined,
              size: 72,
              color: Theme.of(context).colorScheme.outline,
            ),

            const SizedBox(height: 16),

            Text(
              "No Parking Lots Yet",
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 8),

            Text(
              "Create your first parking lot inside this space to start designing the parking layout.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 24),

            FilledButton.icon(
              onPressed: onCreateLot,
              icon: const Icon(Icons.add),
              label: const Text("Create Lot"),
            ),
          ],
        ),
      ),
    );
  }
}