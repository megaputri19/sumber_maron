// ignore: file_names
import 'package:flutter/material.dart';
import 'package:sumber_maron/Components/Login/LoginComponent.dart';

import '../../size_config.dart';

class LoginScreens extends StatelessWidget {
  const LoginScreens({Key? key}) : super(key: key);

  //static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: const LoginComponent(),
    );
  }
}
