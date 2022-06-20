import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/profil_page.dart';

void main() async {
  // Run only if the app has finished loading (BUG ANDROID)
  WidgetsFlutterBinding.ensureInitialized();
  // Call Firebase DB
  await Firebase.initializeApp();
  // Run App
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      title: 'Firebase App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("FireBase Application"),
        ),
        body: const MyWidget(),
      ),
    );
  }
}

