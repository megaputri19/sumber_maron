import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpRegistrasi {
  String? textMessage;

  HttpRegistrasi({
    this.textMessage,
  });

  static Future<HttpRegistrasi> registrasiUser(
    String nama,
    String email,
    String password,
    String telepon,
    String username,
  ) async {
    Uri url = Uri.parse('http://air-maroon.000webhostapp.com/postRegistrasi');

    var hasilResponse = await http.post(url, body: {
      'action': 'registrasi',
      'nama': nama,
      'email': email,
      'password': password,
      'telepon': telepon,
      'username': username,
    });
    var data = json.decode(hasilResponse.body);

    return HttpRegistrasi(
      textMessage: data['textMessage'],
    );
  }
}
