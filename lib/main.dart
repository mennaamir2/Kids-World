import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kids_world/pages/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [],
  );
  runApp(const KidsLearningApp());
}

class KidsLearningApp extends StatelessWidget {
  const KidsLearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Comic',
        scaffoldBackgroundColor: const Color(0xFFFFF9E6),
      ),
      home: const SplashScreen(),
    );
  }
}

