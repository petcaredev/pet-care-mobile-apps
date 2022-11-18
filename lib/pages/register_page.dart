import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/pages/login_page.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';
import 'package:pet_care_mobile_apps/widgets/common_button.dart';
import 'package:pet_care_mobile_apps/widgets/custom_text_form_field.dart';

const List<String> userRole = <String>['Pengguna', 'Klinik'];

class RegisterPage extends StatefulWidget {
  static const route = '/register-page';

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();
  String userRoleValue = userRole.first;

  bool isVisible = false;

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
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: black15, width: 1),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: DropdownButton(
                        value: userRoleValue,
                        style: text13(
                          weight: FontWeight.w400,
                          color: black35,
                        ),
                        elevation: 0,
                        underline: Container(height: 0),
                        isExpanded: true,
                        items: userRole
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            userRoleValue = value!;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CommonButton(
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
                      buttonColor: mainColor,
                      buttonText: 'Daftar',
                      textColor: Colors.white,
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
