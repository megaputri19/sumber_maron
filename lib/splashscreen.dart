import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sumber_maron/Screens/Login/LoginScreens.dart';

// ignore: camel_case_types
class splashscreen extends StatefulWidget {
  //static String routeName = "/splashscreen";
  const splashscreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _splashscreenpagestate createState() => _splashscreenpagestate();
}

// ignore: camel_case_types
class _splashscreenpagestate extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    startLaunching();
  }

  startLaunching() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return const LoginScreens();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 229,
      width: 275,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            "assets/images/logo.png",
            height: 181,
            width: 247,
            fit: BoxFit.contain,
          ))
        ],
      ),
    );
  }
}
