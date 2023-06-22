// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:sumber_maron/Components/Login/LoginForm.dart';
import 'package:sumber_maron/size_config.dart';
import 'package:sumber_maron/utils/constants.dart';

class LoginComponent extends StatefulWidget {
  const LoginComponent({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginComponent createState() => _LoginComponent();
}

class _LoginComponent extends State<LoginComponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(20)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.04,
                    ),
                    //SizedBox(
                    //height: SizeConfig.screenHeight * 0.04,
                    // ),
                    SimpleShadow(
                      opacity: 0.5,
                      color: kSecondaryColor,
                      offset: const Offset(5, 5),
                      sigma: 2,
                      child: Image.asset(
                        "assets/images/smlogo.png",
                        height: 150,
                        width: 202,
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Text(
                            //  "LOGIN !",
                            //  style: mTitleStyle,
                            //)
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    const SignInform()
                  ],
                ),
              ),
            )));
  }
}
