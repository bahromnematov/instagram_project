import 'dart:async';

import 'package:flutter/material.dart';
import 'package:instagram_project/pages/home_page.dart';
import 'package:instagram_project/pages/sign_in_page.dart';
import 'package:instagram_project/service/auth_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      if (AuthService.isLoggedIn()) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) {
              return HomePage();
            },
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) {
              return SignInPage();
            },
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(193, 53, 132, 1),
              Color.fromRGBO(131, 58, 180, 1),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "Instagram",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontFamily: "billabong",
                  ),
                ),
              ),
            ),
            Text(
              "All rights reversed",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
