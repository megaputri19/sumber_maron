import 'package:encrypt/encrypt.dart';
import 'dart:convert';

final key = Key.fromUtf8('TelkomPENS-WisataAlamSumberMaron'); //32 karakter
final iv = IV.fromUtf8('pensDSkarangsuko'); //16 karakter

final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

// Flutter encryption with AES 256 bit
String encrypAES(Map<String, dynamic> jsonData) {
  final plainText = jsonEncode(jsonData); // Convert jsonData to a JSON string
  final plainTextBytes = plainText.codeUnits;
  final encrypted = encrypter.encryptBytes(plainTextBytes, iv: iv);
  return encrypted.base64;
}

// Flutter decryption with AES 256 bit
String decrypAES(String ciphertext) {
  final encrypted = Encrypted.fromBase64(ciphertext);
  final decryptedBytes = encrypter.decryptBytes(encrypted, iv: iv);
  final decryptedText = String.fromCharCodes(decryptedBytes);
  return decryptedText;
}
