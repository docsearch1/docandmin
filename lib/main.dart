import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'views/screens/main_screen.dart';

void main() async {
  //to run this program
  //flutter run -d chrome --web-renderer html

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: kIsWeb || Platform.isAndroid
          ? const FirebaseOptions(
              apiKey: "AIzaSyCtT-pVCRErgdbysZ4Tzwn1hdW8GdJxXxs",
              authDomain: "docsearch-fe590.firebaseapp.com",
              databaseURL: "https://docsearch-fe590.firebaseio.com",
              projectId: "docsearch-fe590",
              storageBucket: "docsearch-fe590.appspot.com",
              messagingSenderId: "531097828971",
              appId: "1:531097828971:web:cd497ffa8fbcac2c0a3b2e",
              measurementId: "G-14SG519S80")
          : null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doc Search Wub Admin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
      builder: EasyLoading.init(),
    );
  }
}
