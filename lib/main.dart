import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_project/pages/splash_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBYZDrKEkDQUwISfFlTLNMqnC6veQlVNWU",
          appId: "1:1064531580572:android:464d14f5fc5ecd6f6bbf59",
          messagingSenderId: "",
          projectId: "sigma-chemist-450512-m9",
          storageBucket: "sigma-chemist-450512-m9.firebasestorage.app"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashPage(),
    );
  }
}
