import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/pages/change_password_page.dart';
import 'package:pet_care_mobile_apps/pages/login_page.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';
import 'package:pet_care_mobile_apps/widgets/common_button.dart';
import 'package:pet_care_mobile_apps/widgets/custom_text_form_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _profileFormKey = GlobalKey<FormState>();

  TextEditingController nameController =
      TextEditingController(text: 'Mohammad Wira Mardhotillah');
  TextEditingController emailController =
      TextEditingController(text: 'mohammadwiram@gmail.com');
  TextEditingController phoneController =
      TextEditingController(text: '082278962314');
  TextEditingController addressController = TextEditingController(
      text:
          'Jl. Kyai Mojo No.18A, Bumijo, Kec. Jetis, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55231');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
          style: text13(weight: FontWeight.w400),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Icon(
                    Icons.help_outline,
                    size: 100,
                    color: otherColor,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  content: Text(
                    'Yakin ingin keluar?',
                    style: text14(
                      color: black85,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, LoginPage.route);
                          },
                          style: ButtonStyle(
                            fixedSize: MaterialStatePropertyAll(
                              Size.fromWidth(100),
                            ),
                            elevation: MaterialStatePropertyAll(0),
                            backgroundColor:
                                MaterialStatePropertyAll(mainColor),
                          ),
                          child: Text(
                            'Ya',
                            style: text13(
                              color: Colors.white,
                              weight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                            fixedSize:
                                MaterialStatePropertyAll(Size.fromWidth(100)),
                            elevation: MaterialStatePropertyAll(0),
                            side: MaterialStatePropertyAll(
                              BorderSide(
                                width: 1,
                                color: black10,
                              ),
                            ),
                          ),
                          child: Text(
                            'Tidak',
                            style: text13(
                              color: otherColor85,
                              weight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
            icon: Icon(
              Icons.logout,
              color: mainColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 137,
                    vertical: 20,
                  ),
                  child: Icon(
                    Icons.account_circle,
                    color: otherColor,
                    size: 100,
                  ),
                ),
              ),
              Form(
                key: _profileFormKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      textEditingController: nameController,
                      textInputType: TextInputType.name,
                      validation: 'Silahkan isi nama lengkap Anda',
                      obscureText: false,
                      hintText: 'Nama Lengkap',
                      textColor: black50,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      textEditingController: emailController,
                      textInputType: TextInputType.emailAddress,
                      validation: 'Silahkan isi nama lengkap Anda',
                      obscureText: false,
                      hintText: 'Email',
                      textColor: black50,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      textEditingController: phoneController,
                      textInputType: TextInputType.phone,
                      validation: 'Silahkan isi nomor telepon Anda',
                      obscureText: false,
                      hintText: 'No. Telepon',
                      textColor: black50,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      textEditingController: addressController,
                      textInputType: TextInputType.streetAddress,
                      validation: 'Silahkan isi alamat Anda',
                      obscureText: false,
                      hintText: 'Alamat',
                      textColor: black50,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CommonButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ChangePasswordPage.route);
                      },
                      buttonColor: mainColor,
                      buttonText: 'Ubah Password',
                      textColor: Colors.white,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CommonButton(
                      onPressed: () {
                        if (_profileFormKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Data berhasil diubah'),
                            ),
                          );
                        }
                      },
                      borderSide: BorderSide(
                        width: 1,
                        color: black15,
                      ),
                      buttonColor: Colors.transparent,
                      buttonText: 'Ubah Data',
                      textColor: black50,
                    ),
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
