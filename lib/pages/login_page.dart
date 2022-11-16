import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/pages/home_page.dart';
import 'package:pet_care_mobile_apps/pages/register_page.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';
import 'package:pet_care_mobile_apps/widgets/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  static const route = '/login-page';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 61),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 61),
                    child: Image(
                      image: AssetImage('images/colored_cat.png'),
                      height: 75,
                    ),
                  ),
                ),
                Form(
                  key: _loginFormKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        textEditingController: emailController,
                        textInputType: TextInputType.emailAddress,
                        validation: 'Silahkan isi email Anda',
                        obscureText: false,
                        hintText: 'Email Anda',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        textEditingController: passwordController,
                        textInputType: TextInputType.visiblePassword,
                        validation: 'Silahkan isi password Anda',
                        obscureText: true,
                        hintText: 'Password Anda',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_loginFormKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, HomePage.route);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Berhasil masuk'),
                        ),
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(mainColor),
                    fixedSize: MaterialStatePropertyAll(
                      Size(MediaQuery.of(context).size.width, 50),
                    ),
                    elevation: MaterialStatePropertyAll(0),
                  ),
                  child: Text(
                    'Masuk',
                    style: text14(
                      weight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum memiliki akun?',
                      style: text14(
                        weight: FontWeight.w400,
                        color: black50,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterPage.route);
                      },
                      child: Text(
                        'Daftar',
                        style: text14(
                          weight: FontWeight.w600,
                          color: mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
