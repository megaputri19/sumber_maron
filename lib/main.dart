import 'package:flutter/material.dart';
import 'package:sumber_maron/splashscreen.dart';
import 'package:sumber_maron/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sumber Maron",
      theme: theme(),
      home: const splashscreen(),

      //initialRoute: LoginScreens.routeName,
      //routes: routes,
    );
  }
}
