import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpLogin {
  String? textMessage, id, name, email, telepon, username, createdAt;

  HttpLogin(
      {this.textMessage,
      this.id,
      this.name,
      this.email,
      this.telepon,
      this.username,
      this.createdAt});

  static Future<HttpLogin> loginUser(String email, String password) async {
    Uri url = Uri.parse('http://air-maroon.000webhostapp.com/postLogin');

    var hasilResponse = await http.post(url, body: {
      'action': 'login',
      'email': email,
      'password': password,
    });
    var data = json.decode(hasilResponse.body);

    return HttpLogin(
      textMessage: data['textMessage'],
      id: data['idUser'],
      name: data['nameUser'],
      email: data['email'],
      telepon: data['telepon'],
      username: data['username'],
      createdAt: data['createdAt'],
    );
  }
}
