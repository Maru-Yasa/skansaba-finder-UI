import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skansaba_finder/providers/auth.dart';
import 'package:skansaba_finder/widgets/icon_button.dart';

class EditProfileData {
  String id = "";
  String nama = "";
  String username = "";
  String password = "";

  bool isChangePassword() {
    if (password.isEmpty || password == null) {
      return false;
    }
    return true;
  }
}

class EditProfileScreen extends StatefulWidget {
  final Map<String, dynamic> myAuth;
  EditProfileScreen({Key? key, required this.myAuth}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  Map<String, dynamic> myAuth = {};
  final EditProfileData _data = EditProfileData();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    myAuth = widget.myAuth;
    _data.id = myAuth['id'];
    _data.nama = myAuth['nama'];
    _data.username = myAuth['username'];
    super.initState();
  }

  String? _namaValidator(String? value) {
    if (value!.isEmpty) {
      return "username kosong";
    }
    return null;
  }

  String? _usernameValidator(String? value) {
    if (value!.isEmpty) {
      return "username kosong";
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value!.isEmpty) {
      return null;
    } else if (value.isNotEmpty) {
      if (value.length < 5) {
        return "Panjang password harus lebih dari 5";
      }
    }
    return null;
  }

  _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Save our form now.
      Provider.of<Auth>(context, listen: false)
          .editProfile(_data)
          .then((value) => {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: Center(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.person,
                          color: Colors.blue,
                          size: 37,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Edit Profile",
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              color: Colors.blue,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            initialValue: _data.nama,
                            obscureText: false,
                            validator: _namaValidator,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                gapPadding: 10,
                              ),
                              labelText: "Nama",
                            ),
                            onSaved: (value) {
                              _data.nama = value ?? "";
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            initialValue: _data.username,
                            obscureText: false,
                            validator: _usernameValidator,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Username",
                            ),
                            onSaved: (value) {
                              _data.username = value ?? "";
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            obscureText: true,
                            validator: _passwordValidator,
                            decoration: const InputDecoration(
                              helperText:
                                  "Jika tidak ingin menganti password, tidak usah diisi",
                              border: OutlineInputBorder(),
                              labelText: "Password",
                              hintText: "Your password here",
                            ),
                            onSaved: (value) {
                              _data.password = value ?? "";
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyIconButton(
                                onPressed: _submit,
                                text: const Text("Edit"),
                                icon: const Icon(Icons.edit),
                                color: Colors.blue,
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
