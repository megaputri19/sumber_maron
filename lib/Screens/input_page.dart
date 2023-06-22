import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sumber_maron/Screens/bookingtiket_page.dart';
import 'package:sumber_maron/Screens/enkripsi_aes256.dart';
// ignore: unused_import
import 'package:sumber_maron/Screens/qrcode_page.dart';
import 'package:sumber_maron/utils/constants.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Static data Email dan Password
  final TextEditingController _controllerEmail =
      TextEditingController(text: 'pengunjung@sumbermaron.com');
  final TextEditingController _controllerPassword =
      TextEditingController(text: 'pengunjungsumbermaron');

  // Tanggal
  final TextEditingController _controllerTanggal = TextEditingController();

  // Menghitung Total Bayar
  final TextEditingController _controllerJumlahTiket = TextEditingController();
  final TextEditingController _controllerBayar = TextEditingController();
  int hargaTiket = 10000;

  // Menghimpun data kedalam jsonData
  final TextEditingController _controllerNama =
      TextEditingController(text: 'Mega');
  final TextEditingController _controllerNoTelepon =
      TextEditingController(text: '085791978816');
  String? _selectedJenisPembayaran;
  Map<String, dynamic> jsonData = {}; // Initialize jsonData as an empty map

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
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            const SizedBox(height: 20),
            const Text(
              'Data Pengunjung\n"Wisata Sumber Maron"',
              textAlign: TextAlign.center,
              style: TextStyle(
                letterSpacing: 2,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Email
            const SizedBox(height: 40),
            TextField(
              enabled: false,
              controller: _controllerEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Masukkan Email',
                label: const Text('Email'),
                icon: const Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            // Password
            const SizedBox(height: 20),
            TextField(
              enabled: true,
              controller: _controllerPassword,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                hintText: 'Masukkan Kata Sandi',
                label: const Text('******'),
                icon: const Icon(Icons.password_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            // Nama Lengkap
            const SizedBox(height: 30),
            TextField(
              readOnly: false,
              controller: _controllerNama,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Masukkan Nama',
                label: const Text('Nama Lengkap'),
                icon: const Icon(Icons.person_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            // Nomor Telepon
            const SizedBox(height: 20),
            TextField(
              readOnly: true,
              controller: _controllerNoTelepon,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Masukkan No Telepon',
                label: const Text('Nomer Telepon'),
                icon: const Icon(Icons.phone_android_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            // Tanggal Pembelian
            const SizedBox(height: 20),
            TextField(
              readOnly: true,
              controller: _controllerTanggal,
              decoration: InputDecoration(
                labelText: 'Pilih Tanggal Pembelian',
                icon: const Icon(Icons.calendar_today_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 90)),
                );
                if (pickedDate != null) {
                  setState(() {
                    _controllerTanggal.text =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                  });
                }
              },
            ),

            // Jumlah Rombongan Tiket
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Masukkan Jumlah Tiket',
                label: const Text('Jumlah Tiket'),
                icon: const Icon(Icons.timer_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              controller: _controllerJumlahTiket,
              onChanged: (value) {
                NumberFormat currencyFormatter = NumberFormat.currency(
                  locale: 'id_ID',
                  symbol: 'Rp',
                  decimalDigits: 0,
                );
                int jumlahTiket = int.tryParse(value) ?? 0;
                int totalBayar = jumlahTiket * hargaTiket;
                _controllerBayar.text = currencyFormatter.format(totalBayar);
              },
            ),

            // Total Bayar
            const SizedBox(height: 20),
            TextField(
              readOnly: true,
              controller: _controllerBayar,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: const Text('Total Bayar'),
                icon: const Icon(Icons.money_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            // Pilihan Jenis Pembayaran
            const SizedBox(height: 20),
            DropdownButtonFormField(
              value: _selectedJenisPembayaran,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedJenisPembayaran = newValue;
                });
              },
              items: const [
                DropdownMenuItem<String>(
                    value: 'Tunai', child: Text('Tunai / Cash')),
                DropdownMenuItem<String>(
                    value: 'Non-Tunai', child: Text('Non-Tunai / Cashless')),
              ],
              decoration: InputDecoration(
                label: const Text('Pilih Jenis Pembayaran'),
                icon: const Icon(Icons.price_change_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            // Button QR Code
            const SizedBox(height: 40),
            SizedBox(
              height: 55,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_controllerEmail.text.isEmpty ||
                      _controllerNama.text.isEmpty ||
                      _controllerTanggal.text.isEmpty ||
                      _controllerJumlahTiket.text.isEmpty ||
                      _controllerBayar.text.isEmpty) {
                    // Jika salah satu controller kosong, berikan pesan error
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: const Text(
                            'Peringatan !',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: const Column(
                            children: [
                              SizedBox(height: 10),
                              Text(
                                'Pastikan semua sudah diisi dengan benar dan tidak boleh ada yang kosong.',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          actions: [
                            CupertinoDialogAction(
                              child: const Text(
                                'Oke',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    jsonData['email'] = _controllerEmail.text;
                    jsonData['nama'] = _controllerNama.text;
                    jsonData['noTelepon'] = _controllerNoTelepon.text;
                    jsonData['tanggal'] = _controllerTanggal.text;
                    jsonData['jumlahTicket'] = _controllerJumlahTiket.text;
                    jsonData['bayar'] = _controllerBayar.text;
                    jsonData['jenisPembayaran'] = _selectedJenisPembayaran;

                    // Proses Enkripsi
                    String encryptedData = encrypAES(jsonData);

                    // Jika salah satu controller kosong, berikan pesan error
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: const Text(
                            'Syarat dan Ketentuan',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text(
                                '1. Kondisi badan sehat dan fit saat berkunjung',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '2. Suhu Tubuh <37,3\u00B0C',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '3. Mencuci tangan sebelum dan setelah berkunjung',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '4. Memakai masker selama berwisata',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '5. Menjaga jarak',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '6. Menjaga kebersihan tempat wisata',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '7. Mengikuti himbauan dan petunjuk petugas wisata',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          actions: [
                            CupertinoDialogAction(
                              child: const Text(
                                'Ya, saya setuju',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                // Navigasi ke halaman QrCodePage dan kirim encryptedData
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return BookingTiketPage(
                                        encryptedData: encryptedData,
                                        nama: _controllerNama.text,
                                        jumlahTiket:
                                            _controllerJumlahTiket.text,
                                        tanggalBooking: _controllerTanggal.text,
                                        totalBayar: _controllerBayar.text,
                                        metodeBayar:
                                            _selectedJenisPembayaran.toString(),
                                        tanggalTransaksi: DateFormat('ddMMyyyy')
                                            .format(DateTime.now()),
                                        noUser: (Random().nextInt(100) + 1)
                                            .toString(),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.qr_code_outlined,
                      color: Colors.white,
                      size: 25,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Buat QR Code Encrypted',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
