import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/pages/home_page.dart';
import 'package:pet_care_mobile_apps/pages/register_page.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';
import 'package:pet_care_mobile_apps/widgets/common_button.dart';
import 'package:pet_care_mobile_apps/widgets/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  static const route = '/login-page';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();

  bool isVisible = false;

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
                        obscureText: isVisible ? false : true,
                        hintText: 'Password Anda',
                        maxLines: 1,
                        suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: Icon(isVisible
                              ? Icons.visibility_off
                              : Icons.visibility),
                          color: otherColor85,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                CommonButton(
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
                  buttonColor: mainColor,
                  buttonText: 'Masuk',
                  textColor: Colors.white,
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
