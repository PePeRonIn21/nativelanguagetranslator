import 'package:flutter/material.dart';
import 'loading_page.dart';

void main() => runApp(TranslatorApp());

class TranslatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language Link',
      home: LoadingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
