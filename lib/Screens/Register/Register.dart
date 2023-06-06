// ignore: file_names
import 'package:flutter/material.dart';
import 'package:sumber_maron/Components/Register/RegisterComponent.dart';

import '../../size_config.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  //static String routeName = "/sign_up";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: const RegisterComponent(),
    );
  }
}
