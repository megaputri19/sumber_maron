import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

// ignore: must_be_immutable
class BookingTiketPage extends StatelessWidget {
  BookingTiketPage({
    Key? key,
    required this.encryptedData,
    required this.nama,
    required this.jumlahTiket,
    required this.tanggalBooking,
    required this.totalBayar,
    required this.metodeBayar,
    required this.tanggalTransaksi,
    required this.noUser,
  }) : super(key: key);

  final String encryptedData;
  final String nama;
  final String jumlahTiket;
  final String tanggalBooking;
  late DateTime parsedDate = DateFormat("dd-MM-yyyy").parse(tanggalBooking);
  final String totalBayar;
  final String metodeBayar;
  final String tanggalTransaksi;
  final String noUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sumber Maron'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.green),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30)),
        ),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            // Banner
            Container(
              height: 150,
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(5)),
                image: DecorationImage(
                  image: AssetImage('assets/images/sumbermaron.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(left: 20, right: 10),
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  // Nama Pengunjung
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Nama Pengunjung :',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 16)),
                        const SizedBox(height: 3),
                        Text(
                          nama,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),

                  // Jumlah Pengunjung
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Jumlah Pengunjung :',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 16)),
                        const SizedBox(height: 3),
                        Text(
                          '$jumlahTiket Orang',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // QR Code
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('QR Code :',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      PrettyQr(
                        data: encryptedData,
                        size: MediaQuery.of(context).size.width * 0.4,
                        roundEdges: true,
                        typeNumber: null,
                        errorCorrectLevel: QrErrorCorrectLevel.L,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      // Tanggal
                      const Text('Tanggal :', style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 3),
                      Text(
                        DateFormat("dd MMMM yyyy").format(parsedDate),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      // Jam
                      const SizedBox(height: 15),
                      const Text('Jam Operasional :',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 3),
                      const Text(
                        '08:00 - 17:00 WIB',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Simpan Tiket')),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              // Code Tiket ( ET = Eticketing, Tgl Booking, Jumlah, Metode, Total, Tgl Transaksi, No User )
              child: Text(
                'ET-${DateFormat("ddMMyyyy").format(parsedDate)}-$jumlahTiket-${(metodeBayar == 'Tunai') ? '1' : '2'}-${totalBayar.replaceAll("Rp", "").replaceAll(".", "")}-$tanggalTransaksi-$noUser',
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Catatan :',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('\u2022'),
                      SizedBox(width: 5),
                      Expanded(
                          child: Text(
                        'Batas scan tiket paling lambat 1 jam sebelum jam operasional berakhir yaitu pukul 16:00 WIB',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 14),
                      ))
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('\u2022'),
                      SizedBox(width: 5),
                      Expanded(
                          child: Text(
                        'Datanglah sesuai tanggal dan jam operasional yang tercantum dalam tiket.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 14),
                      ))
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('\u2022'),
                      SizedBox(width: 5),
                      Expanded(
                          child: Text(
                        'Simpanlah dan scan tiket di loket masuk.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 14),
                      ))
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('\u2022'),
                      SizedBox(width: 5),
                      Expanded(
                          child: Text(
                        'Jagalah kebersihan di lingkungan tempat wisata dengan baik.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 14),
                      ))
                    ],
                  ),
                ],
              ),
            ),

            Container(
              height: 1,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
            ),

            // Total Harga
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Total Harga Tiket',
                      style: TextStyle(fontSize: 16)),
                  Text(
                    totalBayar,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ],
              ),
            ),

            // Metode Pembayaran
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('*Pembayaran: ', style: TextStyle(fontSize: 14)),
                Text(
                  metodeBayar,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
