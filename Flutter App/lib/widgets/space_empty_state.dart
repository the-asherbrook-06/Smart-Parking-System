// Packages
import 'package:flutter/material.dart';

class EmptySpacesView extends StatelessWidget {
  const EmptySpacesView({
    super.key,
    required this.onCreateSpace,
  });

  final VoidCallback onCreateSpace;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.local_parking,
              size: 72,
              color: Theme.of(context).colorScheme.outline,
            ),

            const SizedBox(height: 16),

            Text(
              "No Parking Spaces Yet",
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 8),

            Text(
              "Create your first parking space to start organizing lots and managing parking layouts.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 24),

            FilledButton.icon(
              onPressed: onCreateSpace,
              icon: const Icon(Icons.add),
              label: const Text("Create Space"),
            ),
          ],
        ),
      ),
    );
  }
}