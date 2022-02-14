import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skansaba_finder/models/auth_response_login.dart';
import 'package:skansaba_finder/models/my_auth_response.dart';
import 'package:http/http.dart' as http;
import 'package:skansaba_finder/screens/edit_profile_screen.dart';
import '../config/config.dart';

class Auth with ChangeNotifier {
  dynamic get isLogin async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey("token");
  }

  dynamic get token async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  Future<Map<String, dynamic>> myAuth() async {
    String param = "/api/user/me";
    Uri url = Uri.parse(Config.BASEURL + param);
    var response = await http.get(
      url,
      headers: {"Authorization": "Bearer " + await token},
    );
    if (response.statusCode == 200) {
      MyAuthResponse res = MyAuthResponse.fromJson(jsonDecode(response.body));
      if (res.status == "success") {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString("role", res.data!.role ?? "");
        prefs.setString("nama", res.data!.nama ?? "");
        prefs.setString("username", res.data!.username ?? "");
        return {
          "id": res.data!.id.toString(),
          "nama": res.data!.nama,
          "username": res.data!.username,
          "role": res.data!.role
        };
      } else {
        print(res.errors);
        return {};
      }
    } else {
      print(response.body);
    }
    return {};
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String param = "/api/user/logout";
    Uri url = Uri.parse(Config.BASEURL + param);
    var response = await http.get(
      url,
      headers: {"Authorization": "Bearer " + await token},
    );
    print(response.body.toString());
    prefs.clear();
    notifyListeners();
  }

  Future<String?>? register(LoginData registerData) async {
    var username = registerData.name;
    var password = registerData.password;
    String param = "/api/user/add";
    Uri url = Uri.parse(Config.BASEURL + param);
    return null;
  }

  Future<String?>? login(LoginData loginData) async {
    var username = loginData.name;
    var password = loginData.password;
    String param = "/api/login";
    Uri url = Uri.parse(Config.BASEURL + param);

    Map<String, String> data = {
      "username": username,
      "password": password,
    };
    var response = await http.post(
      url,
      body: data,
    );
    print(response.toString());
    if (response.statusCode == 200) {
      AuthResponseLogin res =
          AuthResponseLogin.fromJson(jsonDecode(response.body));
      if (res.status == "success") {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String token = res.data!.accessToken ?? "";
        if (token != "") {
          prefs.setString("token", token);
          notifyListeners();
        } else {
          throw Exception("token not provided");
        }
      }
    } else if (response.statusCode == 401) {
      throw Exception("Invalid username or password");
    } else {
      throw Exception(response.statusCode.toString());
    }
  }

  Future<void> editProfile(EditProfileData data) async {
    String param = "/api/user/edit/" + data.id;
    Uri url = Uri.parse(Config.BASEURL + param);
    Map<String, dynamic> dataToSend = {};

    if (data.isChangePassword()) {
      dataToSend = {
        "username": data.username,
        "nama": data.nama,
        "password": data.password,
      };
    } else {
      dataToSend = {
        "username": data.username,
        "nama": data.nama,
      };
    }

    var response = await http
        .post(
      url,
      headers: {"Authorization": "Bearer " + await token},
      body: dataToSend,
    )
        .catchError((e) {
      print(e.toString());
      throw e;
    });

    if (response.statusCode == 200) {
      print(response.body.toString());
    } else {
      print(response.body.toString());
    }
  }
}
