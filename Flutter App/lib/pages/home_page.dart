// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons_pro/hugeicons.dart';
import 'package:flutter/material.dart';

// Controllers
import 'package:parkio/controller/auth.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(HugeIconsStroke.logoutCircle01),
            onPressed: () async {
              await ref.read(authControllerProvider.notifier).signOut();

              if (context.mounted) {
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              }
            },
          ),
        ],
      ),
    );
  }
}
