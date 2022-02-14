class AuthResponseLogin {
  String? status;
  String? msg;
  Null? errors;
  Data? data;

  AuthResponseLogin({this.status, this.msg, this.errors, this.data});

  AuthResponseLogin.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    errors = json['errors'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    data['errors'] = errors;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? statusCode;
  String? accessToken;
  String tokenType = "";

  Data({this.statusCode, this.accessToken, required this.tokenType});

  Data.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    return data;
  }
}
