import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/screens/tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/widgets/authentication.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //to ensure that the orientation is set before running the app

  bool isAuthenticated = await Authentication.authenticateWithBiometrics();

  if (isAuthenticated) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]).then(
      (value) => runApp(
        const ProviderScope(
          child: MyApp(),
        ),
      ),
    );
  }
}

var kLightColorTheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  // primary: Colors.black87,
  seedColor: Colors.white,
);

var kDarkColorTheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Colors.black,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorTheme,
      ),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: kLightColorTheme,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      // home: const TabsScreen(),
      home: const TabsScreen(),
    );
  }
}
