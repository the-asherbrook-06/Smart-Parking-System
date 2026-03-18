// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Pages
import 'package:parkio/pages/welcome_page.dart';
import 'package:parkio/pages/space_viewer.dart';

// Themes
import 'package:parkio/theme/theme.dart';
import 'package:parkio/theme/util.dart';

// Configs
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: const ParkIo()));
}

class ParkIo extends StatelessWidget {
  const ParkIo({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Nunito Sans", "Nunito");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.light(),
      darkTheme: theme.dark(),
      routes: {
        '/': (_) => const SplashScreen(),
        '/home': (_) => const SpaceViewer(),
      },
    );
  }
}