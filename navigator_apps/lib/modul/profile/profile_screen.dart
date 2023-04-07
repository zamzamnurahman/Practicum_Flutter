import 'package:flutter/material.dart';

import '../../widget/form_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  TextEditingController _namaCtrl = TextEditingController();
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profile"),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 70,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Form(
                    key: _globalKey,
                    child: Column(
                      children: [
                        ///[* form data nama lengkap]
                        FormWidget(
                            controller: _namaCtrl,
                            label: "Nama Lengkap",
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Harap isi nama lengkap";
                              }
                              return null;
                            }),

                        ///[* form data Email]
                        FormWidget(
                            controller: _emailCtrl,
                            label: "Alamat Email",
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Harap isi Alamat email";
                              }
                              return null;
                            }),

                        ///[* form Password]
                        FormWidget(
                            controller: _passwordCtrl,
                            label: "Password",
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Harap isi Password";
                              } else if (value.length < 8) {
                                return "Harap isi password minimal 8 karakter";
                              }
                              return null;
                            }),

                        ///[* form Password]
                        FormWidget(
                            controller: _passwordCtrl,
                            label: "Username",
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Harap isi Password";
                              } else if (value.length < 8) {
                                return "Harap isi password minimal 8 karakter";
                              }
                              return null;
                            }),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_globalKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(seconds: 1),
                            backgroundColor: Colors.green,
                            content: Text("Berhasil menyimpan profile"),
                          ),
                        );
                      }
                    },
                    child: const Text("Simpan Profile")),
                const SizedBox(height: 10)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
