import 'package:http/http.dart' as http;

class LoginProvider {
  void login(String? username, String? password) async {
    Map<String?, String?> data = {'username': username, 'password': password};

    var url = Uri.http("127.0.0.1:8000", "/api/login");
    print(data);
    var response = await http.post(
      url,
      body: data,
    );

    if (response.statusCode == 200) {
      print(response.body);
    }
    print(response.body);
  }
}
