// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart' as auth;
import '../components/my_container.dart';
import '../components/my_form_field.dart';
import '../models/login_model.dart';
import 'package:flutter_login/flutter_login.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const String routeName = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Duration get loginTime => Duration(milliseconds: 2250);
  Future<String?>? _loginController(LoginData data) {
    return Future.delayed(loginTime).then((_) async {
      try {
        await Provider.of<auth.Auth>(context, listen: false).login(data);
      } catch (e) {
        return e.toString();
      }
    });
  }

  // Future<String?>? _register(LoginData data) {
  //   return Future.delayed(loginTime).then((_) async {
  //     try {
  //       await Provider.of<auth.Auth>(context, listen: false).register(data);
  //     } catch (e) {
  //       return e.toString();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterLogin(
        disableCustomPageTransformer: true,
        hideForgotPasswordButton: true,
        additionalSignupFields: [
          UserFormField(
            keyName: "nis",
            displayName: "NIS",
            icon: Icon(Icons.person),
            fieldValidator: (value) {
              if (value!.isNotEmpty) {
                return null;
              } else if (value.length > 5) {
                return "NIS too long";
              }
              return "NIS empty";
            },
          ),
          UserFormField(
            keyName: "nama",
            displayName: "Name",
            icon: Icon(Icons.person),
            fieldValidator: (value) {
              if (value!.isNotEmpty) {
                return null;
              }
              return "Name empty";
            },
          ),
        ],
        loginAfterSignUp: false,
        messages: LoginMessages(
          userHint: "Username",
          signUpSuccess: "Berhasil mendaftar",
        ),
        userType: LoginUserType.name,
        onSignup: (value) {},
        logo: AssetImage("images/logo.png"),
        title: "Skansaba Finder",
        onLogin: _loginController,
        onSubmitAnimationCompleted: () {
          Navigator.pushNamedAndRemoveUntil(
              context, HomeScreen.routeName, (route) => false);
        },
        onRecoverPassword: (value) {},
        userValidator: (value) {
          if (value!.isNotEmpty) {
            return null;
          } else {
            return "username empty";
          }
        },
      ),
    );
    ;
  }
}
