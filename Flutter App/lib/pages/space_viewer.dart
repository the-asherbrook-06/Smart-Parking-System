// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Controllers
import 'package:parkio/controller/auth.dart';

// Providers
import 'package:parkio/provider/repository_provider.dart';
import 'package:parkio/provider/bottomnavbar.dart';
import 'package:parkio/provider/space_provider.dart';

// Models
import 'package:parkio/model/space_model.dart';

// Pages
import 'package:parkio/pages/lot_viewer.dart';

// Widgets
import 'package:parkio/widgets/bottom_navbar.dart';
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
                controller: controller,
                autofocus: true,
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
                  onPressed: () async {
                    final name = controller.text.trim();
                    if (name.isEmpty) return;

                    await ref.read(spaceRepositoryProvider).createSpace(name);

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

  Widget _buildSpacesBody(BuildContext context, WidgetRef ref, List<Space> spaces) {
    if (spaces.isEmpty) {
      return EmptySpacesView(
        onCreateSpace: () {
          showCreateSpaceSheet(context, ref);
        },
      );
    }

    return ListView.separated(
      itemCount: spaces.length,
      separatorBuilder: (_, _) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final space = spaces[index];

        return ListTile(
          leading: const CircleAvatar(child: Icon(Icons.domain)),
          title: Text(space.name),
          subtitle: Text("${space.lots.length} lots"),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => LotViewer(spaceId: space.id)),
            );
          },
        );
      },
    );
  }

  Widget _buildProfileView(BuildContext context, AsyncValue<User?> authState) {
    final textTheme = Theme.of(context).textTheme;
    return authState.when(
      data: (user) {
        final name = user?.displayName ?? "Parkio User";
        final email = user?.email ?? "Not provided";
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          children: [
            Text(
              "User Profile",
              style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name", style: textTheme.bodyMedium),
                    const SizedBox(height: 4),
                    Text(name, style: textTheme.titleMedium),
                    const SizedBox(height: 12),
                    Text("Company name", style: textTheme.bodyMedium),
                    const SizedBox(height: 4),
                    Text("Parkio Pvt Ltd.", style: textTheme.titleMedium),
                    const SizedBox(height: 12),
                    Text("Phone no", style: textTheme.bodyMedium),
                    const SizedBox(height: 4),
                    Text("+91 99999 12345", style: textTheme.titleMedium),
                    const SizedBox(height: 12),
                    Text("Company Address", style: textTheme.bodyMedium),
                    const SizedBox(height: 4),
                    Text(
                      "Door 23, Kilpauk, Chennai, Tamil Nadu, Chennai District, 600010",
                      style: textTheme.bodySmall,
                    ),
                    const SizedBox(height: 16),
                    Text("Email", style: textTheme.bodyMedium),
                    const SizedBox(height: 4),
                    Text(email, style: textTheme.bodySmall),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text("Profile editing is coming soon.")));
              },
              child: const Text("Edit Profile"),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text("Cannot load profile details: $error")),
    );
  }

  Widget _buildAccountView(BuildContext context, WidgetRef ref, AsyncValue<User?> authState) {
    return authState.when(
      data: (user) {
        final displayName = user?.displayName ?? 'Parkio User';
        final email = user?.email ?? 'No email';
        final initials = displayName.isNotEmpty
            ? displayName.trim().split(" ").map((e) => e.isNotEmpty ? e[0] : "").join()
            : "P";

        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                child: Text(initials, style: const TextStyle(fontSize: 24)),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  Text(displayName, style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 4),
                  Text(email, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
            const SizedBox(height: 32),
            FilledButton(
              onPressed: () async {
                await ref.read(authControllerProvider.notifier).signOut();
                ref.read(bottomNavbarIndexProvider.notifier).state = 0;

                if (context.mounted) {
                  Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                }
              },
              child: const Text("Sign Out"),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text("Account settings coming soon.")));
              },
              child: const Text("Account Settings"),
            ),
            const SizedBox(height: 24),
            const Text("Support", style: TextStyle(fontWeight: FontWeight.bold)),
            const ListTile(leading: Icon(Icons.help_outline), title: Text("Help center")),
            const ListTile(leading: Icon(Icons.bug_report), title: Text("Report a problem")),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text("Unable to load profile: $error")),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spacesAsync = ref.watch(spacesProvider);
    final currentIndex = ref.watch(bottomNavbarIndexProvider);
    final accountState = ref.watch(authControllerProvider);

    late final Widget body;
    late final String title;

    switch (currentIndex) {
      case 1:
        title = "User Profile";
        body = _buildProfileView(context, accountState);
        break;

      case 2:
        title = "Account";
        body = _buildAccountView(context, ref, accountState);
        break;

      default:
        return spacesAsync.when(
          loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),

          error: (e, _) => Scaffold(body: Center(child: Text("Error: $e"))),

          data: (spaces) {
            final hasSpaces = spaces.isNotEmpty;

            return Scaffold(
              appBar: AppBar(
                title: Text(hasSpaces ? "Your Parkio Spaces" : "Parkio Spaces"),
                centerTitle: false,
              ),

              body: _buildSpacesBody(context, ref, spaces),

              floatingActionButton: hasSpaces
                  ? FloatingActionButton(
                      onPressed: () => showCreateSpaceSheet(context, ref),
                      child: const Icon(Icons.add),
                    )
                  : null,

              bottomNavigationBar: const BottomNavbar(),
            );
          },
        );
    }

    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: false),
      body: body,
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
