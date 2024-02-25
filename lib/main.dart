import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'loading_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class TranslatorApp extends StatelessWidget {
  const TranslatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Language Link',
      home: LoadingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
