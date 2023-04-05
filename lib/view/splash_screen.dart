import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todoapp_with_provider/utils/common_strings.dart';
import 'package:todoapp_with_provider/utils/routes.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    initData();
    super.initState();
  }

  initData(){
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, Routes.homeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return const Scaffold(
      backgroundColor: Colors.white,
      body:  Center(
        child: Text(UtilStrings.appName,style: TextStyle(
          color: Colors.blue,
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}
