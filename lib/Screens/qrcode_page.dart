// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:sumber_maron/utils/constants.dart';

class QRCodePage extends StatelessWidget {
  const QRCodePage({
    Key? key,
    required this.encryptedData,
  }) : super(key: key);

  final String encryptedData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset('assets/images/logoapp.png', fit: BoxFit.cover),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              'QR Code Encrypted',
              textAlign: TextAlign.center,
              style: TextStyle(
                letterSpacing: 2,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            // QR Code
            const SizedBox(height: 50),

            PrettyQr(
              data: encryptedData,
              size: 250,
              roundEdges: true,
              typeNumber: null,
              errorCorrectLevel: QrErrorCorrectLevel.L,
            ),

            // Isi teks QR Code
            const SizedBox(height: 10),
            Text(
              encryptedData,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w200),
            ),
          ],
        ),
      ),
    );
  }
}
