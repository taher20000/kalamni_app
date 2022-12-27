import 'dart:async';
import 'package:flutter/material.dart';

import '../../home/home_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () =>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen())));
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                Color(0x0fff800b),
                Color(0xffCE1010),
              ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/image/mobile3.png',
                  height: 300.0,
                  width: 300.0,
                ),
              ],
            ),
            const Text(
              'Welcome Back !',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
