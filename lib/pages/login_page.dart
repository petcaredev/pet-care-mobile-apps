import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pet_care_mobile_apps/pages/home_page.dart';
import 'package:pet_care_mobile_apps/pages/register_page.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';
import 'package:pet_care_mobile_apps/widgets/common_button.dart';
import 'package:pet_care_mobile_apps/widgets/custom_text_form_field.dart';
import 'package:pet_care_mobile_apps/data/api/api_service.dart';
import 'package:pet_care_mobile_apps/providers/auth_provider.dart';
import 'package:pet_care_mobile_apps/providers/auth_preferences_provider.dart';
import 'package:pet_care_mobile_apps/data/models/error_response.dart';
import 'package:pet_care_mobile_apps/data/models/form_error_response.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authPreferencesProvider =
          Provider.of<AuthPreferencesProvider>(context, listen: false);
      if (authPreferencesProvider.isSignedIn) {
        Navigator.pushReplacementNamed(context, HomePage.route);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 61),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 61),
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
                      const SizedBox(
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
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                CommonButton(
                  onPressed: () {
                    if (_loginFormKey.currentState!.validate()) {
                      AuthProvider(apiService: ApiService())
                          .signIn(emailController.text, passwordController.text)
                          .then(
                        (result) {
                          if (result.error) {
                            if (result is ErrorResponse) {
                              Fluttertoast.showToast(
                                msg: result.message,
                                backgroundColor: errorColor,
                                fontSize: 14,
                                textColor: Colors.white,
                              );
                            } else if (result is FormErrorResponse) {
                              for (var error in result.errors) {
                                Fluttertoast.showToast(
                                  msg: error.msg!,
                                  backgroundColor: errorColor,
                                  fontSize: 14,
                                  textColor: Colors.white,
                                );
                              }
                            }
                          } else {
                            Provider.of<AuthPreferencesProvider>(context,
                                listen: false)
                              ..enableSignIn(true)
                              ..setDataUserAuth(result.data);
                            Navigator.pushReplacementNamed(
                                context, HomePage.route);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(result.message),
                              ),
                            );
                          }
                        },
                      );
                    }
                  },
                  buttonColor: mainColor,
                  buttonText: 'Masuk',
                  textColor: Colors.white,
                ),
                const SizedBox(
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
