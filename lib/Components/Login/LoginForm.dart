// ignore: file_names
import 'package:flutter/material.dart';
import 'package:sumber_maron/Components/custom_surfix_icon.dart';
import 'package:sumber_maron/Components/default_button_custome_color.dart';
import 'package:sumber_maron/Screens/Register/Register.dart';
import 'package:sumber_maron/homepage.dart';
import 'package:sumber_maron/http_login.dart';
import 'package:sumber_maron/size_config.dart';
import 'package:sumber_maron/utils/constants.dart';

class SignInform extends StatefulWidget {
  const SignInform({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignInform createState() => _SignInform();
}

class _SignInform extends State<SignInform> {
  HttpLogin dataResponse = HttpLogin();
  final formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;

  TextEditingController txtEmail = TextEditingController(),
      txtPassword = TextEditingController();

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        buildEmail(),
        SizedBox(height: getProportionateScreenHeight(30)),
        buildPassword(),
        SizedBox(height: getProportionateScreenHeight(30)),
        Row(
          children: [
            Checkbox(
                value: remember,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                }),
            const Text("Tetap Masuk"),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: const Text(
                "Lupa Kata Sandi?",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
        DefaultButtonCustomeColor(
          color: kPrimaryColor,
          text: "Masuk",
          press: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const homepage()));
            HttpLogin.loginUser(
              txtEmail.text,
              txtPassword.text,
            ).then((value) {
              dataResponse = value;
              // ignore: avoid_print
              print(dataResponse.textMessage);

              if (dataResponse.textMessage == 'Login berhasil.') {
                // ignore: avoid_print
                print(dataResponse.email);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const homepage();
                    },
                  ),
                );
              }
            });
          },
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                // ignore: prefer_const_constructors
                MaterialPageRoute(builder: (context) => RegisterScreen()));
          },
          child: const Text(
            "Belum Punya Akun ? Daftar Di sini",
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        )
      ],
    ));
  }

  TextFormField buildEmail() {
    return TextFormField(
      controller: txtEmail,
      keyboardType: TextInputType.emailAddress,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'E-Mail',
          hintText: 'Masukkan e-mail anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const CustomSurffixIcon(
            svgIcon: "assets/icons/Mail.svg",
          )),
    );
  }

  TextFormField buildPassword() {
    return TextFormField(
      controller: txtPassword,
      obscureText: true,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Kata Sandi',
          hintText: 'Masukkan kata sandi anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const CustomSurffixIcon(
            svgIcon: "assets/icons/Lock.svg",
          )),
    );
  }
}
