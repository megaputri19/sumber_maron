import 'package:flutter/material.dart';
import 'package:sumber_maron/Screens/input_page.dart';
import 'package:sumber_maron/utils/constants.dart';

// ignore: camel_case_types
class FormTicket extends StatefulWidget {
  const FormTicket({Key? key}) : super(key: key);

  @override
  State<FormTicket> createState() => _FormTicketState();
}

// ignore: camel_case_types
class _FormTicketState extends State<FormTicket> {
  bool isPressed1 = true;
  bool isPressed2 = true;
  bool isPressed3 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset('assets/images/logoapp.png', fit: BoxFit.cover),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: 230,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/sumbermaron.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 65,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isPressed1 = !isPressed1;
                          isPressed2 = true;
                          isPressed3 = true;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: isPressed1 ? Colors.grey[300] : Colors.orange,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Harga Tiket',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: isPressed1
                                      ? kPrimaryColor
                                      : Colors.white),
                            ),
                            Text(
                              'Rp 10.000/orang',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: isPressed1
                                      ? kPrimaryColor
                                      : Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isPressed1 = true;
                          isPressed3 = true;
                          isPressed2 = !isPressed2;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: isPressed2 ? Colors.grey[300] : Colors.orange,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Total Kuota',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: isPressed2
                                      ? kPrimaryColor
                                      : Colors.white),
                            ),
                            Text(
                              '500 orang',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: isPressed2
                                      ? kPrimaryColor
                                      : Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isPressed1 = true;
                          isPressed2 = true;
                          isPressed3 = !isPressed3;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: isPressed3 ? Colors.grey[300] : Colors.orange,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Sisa Kuota',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: isPressed3
                                      ? kPrimaryColor
                                      : Colors.white),
                            ),
                            Text(
                              '200 orang',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: isPressed3
                                      ? kPrimaryColor
                                      : Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
            child: const Text(
              'Sumber Maron',
              style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 2,
            margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
            color: Colors.grey[300],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text(
              '\tWisata Sumber Maron menawarkan wisata alam ala pedesaan di Malang yang masih asri. Dimana terdapat Arung jeram, susur sungai dengan ban & berenang melewati area alam yang dilindungi. Selain berenang pengunjung juga dapat mencoba wahana Flying Fox dan Terapi Ikan yang sangat bermanfaat bagi Kesehatan, serta dilengkapi kafe dengan berbagai macam makanan.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.only(top: 50),
            child: SizedBox(
              height: 55,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const InputPage();
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Beli Tiket disini',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
