import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/pages/change_password_page.dart';
import 'package:pet_care_mobile_apps/pages/login_page.dart';
import 'package:pet_care_mobile_apps/providers/profile_provider.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';
import 'package:pet_care_mobile_apps/utils/result_state.dart';
import 'package:pet_care_mobile_apps/widgets/common_button.dart';
import 'package:pet_care_mobile_apps/widgets/custom_text_form_field.dart';
import 'package:pet_care_mobile_apps/providers/auth_preferences_provider.dart';
import 'package:pet_care_mobile_apps/providers/bottom_navigation_bar_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _profileFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Profil',
          style: text14(weight: FontWeight.w500),
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
                            Provider.of<AuthPreferencesProvider>(context,
                                listen: false)
                              ..enableSignIn(false)
                              ..clearDataUserAuth();
                            Provider.of<BottomNavigationBarProvider>(context,
                                    listen: false)
                                .resetCurrentIndex();
                            Navigator.pushReplacementNamed(
                                context, LoginPage.route);
                          },
                          style: ButtonStyle(
                            fixedSize: const MaterialStatePropertyAll(
                              Size.fromWidth(100),
                            ),
                            elevation: const MaterialStatePropertyAll(0),
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
                        const SizedBox(
                          width: 16,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.white),
                            fixedSize: const MaterialStatePropertyAll(
                                Size.fromWidth(100)),
                            elevation: const MaterialStatePropertyAll(0),
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
        automaticallyImplyLeading: false,
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
                    Consumer<ProfileProvider>(
                      builder: (context, provider, child) {
                        if (provider.state == ResultState.loading) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: black15, width: 1),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: LinearProgressIndicator(
                              color: mainColor,
                              minHeight: 64,
                            ),
                          );
                        } else if (provider.state == ResultState.hasData) {
                          return CustomTextFormField(
                            textEditingController: TextEditingController(
                                text: provider.result.data.name),
                            textInputType: TextInputType.name,
                            validation: 'Silahkan isi nama lengkap Anda',
                            obscureText: false,
                            hintText: 'Nama Lengkap',
                            textColor: black50,
                          );
                        } else if (provider.state == ResultState.error) {
                          return Text(provider.message);
                        } else {
                          return const Text('Maaf, terjadi kesalahan');
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Consumer<ProfileProvider>(
                      builder: (context, provider, child) {
                        if (provider.state == ResultState.loading) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: black15, width: 1),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: LinearProgressIndicator(
                              color: mainColor,
                              minHeight: 64,
                            ),
                          );
                        } else if (provider.state == ResultState.hasData) {
                          return CustomTextFormField(
                            textEditingController: TextEditingController(
                                text: provider.result.data.email),
                            textInputType: TextInputType.emailAddress,
                            validation: 'Silahkan isi email Anda',
                            obscureText: false,
                            hintText: 'Email',
                            textColor: black50,
                          );
                        } else if (provider.state == ResultState.error) {
                          return Text(provider.message);
                        } else {
                          return const Text('Maaf, terjadi kesalahan');
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Consumer<ProfileProvider>(
                      builder: (context, provider, child) {
                        if (provider.state == ResultState.loading) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: black15, width: 1),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: LinearProgressIndicator(
                              color: mainColor,
                              minHeight: 64,
                            ),
                          );
                        } else if (provider.state == ResultState.hasData) {
                          return CustomTextFormField(
                            textEditingController: TextEditingController(
                                text: provider.result.data.phone),
                            textInputType: TextInputType.phone,
                            validation: 'Silahkan isi nomor telepon Anda',
                            obscureText: false,
                            hintText: 'No. Telepon',
                            textColor: black50,
                          );
                        } else if (provider.state == ResultState.error) {
                          return Text(provider.message);
                        } else {
                          return const Text('Maaf, terjadi kesalahan');
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Consumer<ProfileProvider>(
                      builder: (context, provider, child) {
                        if (provider.state == ResultState.loading) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: black15, width: 1),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: LinearProgressIndicator(
                              color: mainColor,
                              minHeight: 64,
                            ),
                          );
                        } else if (provider.state == ResultState.hasData) {
                          return CustomTextFormField(
                            textEditingController: TextEditingController(
                                text: provider.result.data.address),
                            textInputType: TextInputType.streetAddress,
                            validation: 'Silahkan isi alamat Anda',
                            obscureText: false,
                            hintText: 'Alamat',
                            textColor: black50,
                          );
                        } else if (provider.state == ResultState.error) {
                          return Text(provider.message);
                        } else {
                          return const Text('Maaf, terjadi kesalahan');
                        }
                      },
                    ),
                    const SizedBox(
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
                    const SizedBox(
                      height: 15,
                    ),
                    CommonButton(
                      onPressed: () {
                        if (_profileFormKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
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
                    const SizedBox(
                      height: 15,
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
