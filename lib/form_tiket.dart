import 'package:flutter/material.dart';
import 'package:sumber_maron/utils/constants.dart';

// ignore: camel_case_types
class form_tiket extends StatefulWidget {
  const form_tiket({Key? key}) : super(key: key);

  @override
  State<form_tiket> createState() => _form_tiketState();
}

// ignore: camel_case_types
class _form_tiketState extends State<form_tiket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Image.asset('assets/images/logoapp.png', fit: BoxFit.cover),
          backgroundColor: kPrimaryColor,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
                children: [Image.asset('assets/images/sumbermaron.png')])));
  }
}
