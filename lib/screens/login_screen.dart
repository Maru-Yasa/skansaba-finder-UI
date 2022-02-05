// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/my_container.dart';
import '../components/my_form_field.dart';
import '../models/login_model.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final model = LoginModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: MyContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    "Login",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              Container(
                margin: EdgeInsets.all(10),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        MyFormField(
                            isObscure: false,
                            prefixIcon: Icon(Icons.person),
                            hint: "Username",
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please enter an username';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              this.model.username = value;
                            },
                            margin: EdgeInsets.only(right: 20, left: 20)),
                        MyFormField(
                            isObscure: true,
                            prefixIcon: Icon(Icons.lock),
                            hint: "Password",
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              this.model.password = value;
                            },
                            margin:
                                EdgeInsets.only(right: 20, left: 20, top: 15)),
                        ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                              }
                            },
                            child: Text('Login'))
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}