// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:sumber_maron/Components/Register/RegisterForm.dart';
import 'package:sumber_maron/size_config.dart';
import 'package:sumber_maron/utils/constants.dart';

class RegisterComponent extends StatefulWidget {
  const RegisterComponent({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterComponent createState() => _RegisterComponent();
}

class _RegisterComponent extends State<RegisterComponent> {
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
                    //SizedBox(
                    //height: SizeConfig.screenHeight * 0.06,
                    //),
                    //SizedBox(
                    //height: SizeConfig.screenHeight * 0.04,
                    //),
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
                    Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            //Text(
                            //  "LOGIN !",
                            //  style: mTitleStyle,
                            //)
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    const SignUpForm()
                  ],
                ),
              ),
            )));
  }
}
