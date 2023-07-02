// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sumber_maron/Components/custom_surfix_icon.dart';
import 'package:sumber_maron/Components/default_button_custome_color.dart';
import 'package:sumber_maron/Screens/Login/LoginScreens.dart';
import 'package:sumber_maron/http_registrasi.dart';
import 'package:sumber_maron/size_config.dart';
import 'package:sumber_maron/utils/constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpForm createState() => _SignUpForm();
}

class _SignUpForm extends State<SignUpForm> {
  HttpRegistrasi dataResponse = HttpRegistrasi();
  final formKey = GlobalKey<FormState>();
  String? username;
  String? email;
  String? password;
  String? phone;
  bool? remember = false;

  TextEditingController txtUserName = TextEditingController(),
      txtNama = TextEditingController(),
      txtEmail = TextEditingController(),
      txtPassword = TextEditingController(),
      txtPhone = TextEditingController(),
      txtUsername = TextEditingController();

  FocusNode focusNode = FocusNode();

  // ignore: prefer_typing_uninitialized_variables
  var http;
  Future register() async {
    try {
      Uri url = Uri.parse(
          "http://herbs.ptmegadeal.com/air-maroon/functionRegister.php");
      return await http.get(
        url,
        body: {
          "nama": txtNama.text,
          "email": txtEmail.text,
          "password": txtPassword.text,
          "telepon": txtPhone.text,
          "username": txtUsername.text,
        },
      ).then(
        (value) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginScreens()));
        },
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        buildUserName(),
        SizedBox(height: getProportionateScreenHeight(30)),
        buildEmail(),
        SizedBox(height: getProportionateScreenHeight(30)),
        buildPassword(),
        SizedBox(height: getProportionateScreenHeight(30)),
        buildPhone(),
        SizedBox(height: getProportionateScreenHeight(30)),
        DefaultButtonCustomeColor(
          color: kPrimaryColor,
          text: "Daftar",
          press: () {
            // register();
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const LoginScreens()));
            HttpRegistrasi.registrasiUser(
              txtNama.text,
              txtEmail.text,
              txtPassword.text,
              txtPhone.text,
              txtUsername.text,
            ).then((value) {
              dataResponse = value;
              print(dataResponse.textMessage);

              if (dataResponse.textMessage == 'Registrasi berhasil.') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreens();
                    },
                  ),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: const Text('Registrasi Gagal!'),
                      content: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(dataResponse.textMessage.toString()),
                      ),
                      actions: [
                        CupertinoDialogAction(
                          child: const Text(
                            'Oke',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreens()));
          },
          child: const Text(
            "Sudah Punya Akun ? Masuk Disini",
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        )
      ],
    ));
  }

  TextFormField buildUserName() {
    return TextFormField(
      controller: txtUserName,
      keyboardType: TextInputType.name,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Nama Lengkap',
          hintText: 'Masukkan Nama Lengkap anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const CustomSurffixIcon(
            svgIcon: "assets/icons/User.svg",
          )),
    );
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

  TextFormField buildPhone() {
    return TextFormField(
      controller: txtPhone,
      keyboardType: TextInputType.phone,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'No Telepon',
          hintText: 'Masukkan no telepon aktif anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const CustomSurffixIcon(
            svgIcon: "assets/icons/Phone.svg",
          )),
    );
  }
}
