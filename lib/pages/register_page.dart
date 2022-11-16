import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/pages/login_page.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';
import 'package:pet_care_mobile_apps/widgets/custom_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  static const route = '/register-page';

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Image(
                    image: AssetImage('images/colored_cat.png'),
                    height: 75,
                  ),
                ),
              ),
              Form(
                key: _registerFormKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      textEditingController: fullNameController,
                      textInputType: TextInputType.name,
                      validation: 'Silahkan isi nama lengkap Anda',
                      obscureText: false,
                      hintText: 'Nama lengkap Anda',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      textEditingController: phoneController,
                      textInputType: TextInputType.phone,
                      validation: 'Silahkan isi nomor handphone Anda',
                      obscureText: false,
                      hintText: 'Nomor telepon Anda',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      textEditingController: addressController,
                      textInputType: TextInputType.streetAddress,
                      validation: 'Silahkan isi alamat Anda',
                      obscureText: false,
                      hintText: 'Alamat Anda',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      textEditingController: userEmailController,
                      textInputType: TextInputType.emailAddress,
                      validation: 'Silahkan isi email Anda',
                      obscureText: false,
                      hintText: 'Email Anda',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      textEditingController: userPasswordController,
                      textInputType: TextInputType.visiblePassword,
                      validation: 'Silahkan isi password Anda',
                      obscureText: true,
                      hintText: 'Password Anda',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_registerFormKey.currentState!.validate()) {
                          Navigator.pushReplacementNamed(
                              context, LoginPage.route);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Akun berhasil dibuat'),
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
                        'Daftar',
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
                          'Sudah memiliki akun?',
                          style: text14(
                            weight: FontWeight.w400,
                            color: black50,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Masuk',
                            style: text14(
                              weight: FontWeight.w600,
                              color: mainColor,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
