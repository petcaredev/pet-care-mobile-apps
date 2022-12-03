import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pet_care_mobile_apps/data/account_data.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';
import 'package:pet_care_mobile_apps/widgets/common_button.dart';
import 'package:pet_care_mobile_apps/widgets/custom_text_form_field.dart';

class ChangePasswordPage extends StatefulWidget {
  static const route = '/change-password-page';

  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _changePasswordFormKey = GlobalKey<FormState>();

  bool isOldPasswordVisible = false;
  bool isNewPasswordVisible = false;
  bool isNewPasswordConfirmationVisible = false;

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordConfirmationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Ubah Password',
          style: text13(weight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Form(
              key: _changePasswordFormKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    textEditingController: oldPasswordController,
                    textInputType: TextInputType.visiblePassword,
                    validation: 'Masukkan password lama Anda',
                    obscureText: isOldPasswordVisible ? false : true,
                    hintText: 'Password Lama',
                    maxLines: 1,
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          isOldPasswordVisible = !isOldPasswordVisible;
                        });
                      },
                      icon: Icon(isOldPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility),
                      color: otherColor85,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    textEditingController: newPasswordController,
                    textInputType: TextInputType.visiblePassword,
                    validation: 'Masukkan password baru Anda',
                    obscureText: isNewPasswordVisible ? false : true,
                    hintText: 'Password Baru',
                    maxLines: 1,
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          isNewPasswordVisible = !isNewPasswordVisible;
                        });
                      },
                      icon: Icon(isNewPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility),
                      color: otherColor85,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    textEditingController: newPasswordConfirmationController,
                    textInputType: TextInputType.visiblePassword,
                    validation: 'Konfirmasi password baru Anda',
                    obscureText:
                        isNewPasswordConfirmationVisible ? false : true,
                    hintText: 'Konfirmasi Password Baru',
                    maxLines: 1,
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          isNewPasswordConfirmationVisible =
                              !isNewPasswordConfirmationVisible;
                        });
                      },
                      icon: Icon(isNewPasswordConfirmationVisible
                          ? Icons.visibility_off
                          : Icons.visibility),
                      color: otherColor85,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CommonButton(
                    onPressed: () {
                      if (_changePasswordFormKey.currentState!.validate()) {
                        if (oldPasswordController.text == password) {
                          if (newPasswordController.text.length >= 8) {
                            if (newPasswordController.text ==
                                newPasswordConfirmationController.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Password berhasil diubah'),
                                ),
                              );
                            } else {
                              Fluttertoast.showToast(
                                msg: 'Konfirmasi password salah',
                                backgroundColor: errorColor,
                                fontSize: 14,
                              );
                            }
                          } else {
                            Fluttertoast.showToast(
                              msg: 'Password minimal 8 karakter',
                              backgroundColor: errorColor,
                              fontSize: 14,
                            );
                          }
                        } else {
                          Fluttertoast.showToast(
                            msg: 'Password lama tidak sesuai',
                            backgroundColor: errorColor,
                            fontSize: 14,
                          );
                        }
                      }
                    },
                    buttonColor: mainColor,
                    buttonText: 'Ubah Password',
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
