import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sumber_maron/form_tiket.dart';
// ignore: unused_import
import 'package:sumber_maron/size_config.dart';
import 'package:sumber_maron/utils/constants.dart';

// ignore: camel_case_types
class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

// ignore: camel_case_types
class _homepageState extends State<homepage> {
  final Completer<GoogleMapController> _controllerMaps = Completer();

  static const LatLng _center = LatLng(-8.1653753, 112.5936621);

  // ignore: unused_field
  final MapType _currentMapType = MapType.normal;

  // ignore: unused_field
  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    _controllerMaps.complete(controller);
  }

  int _current = 0;
  final CarouselController _controller = CarouselController();
  List<String> images = [
    "https://i.postimg.cc/Y28g7KRk/sumbermaron.png",
    "https://i.postimg.cc/V6j6vww4/sumbermaron2.jpg",
    "https://i.postimg.cc/TYrnW8dy/sumbermaron3.jpg"
  ];
  List<String> imagespromo = [
    "https://i.postimg.cc/ZYjg6YnJ/promo.png",
    "https://i.postimg.cc/ZYjg6YnJ/promo.png",
    "https://i.postimg.cc/ZYjg6YnJ/promo.png"
  ];
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
          CarouselSlider(
            items: images
                .map(
                  (item) => Container(
                    margin: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      child: Stack(
                        children: <Widget>[
                          Image.network(
                            item,
                            fit: BoxFit.cover,
                            width: 1000.0,
                          ),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(200, 0, 0, 0),
                                    Color.fromARGB(0, 0, 0, 0)
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              viewportFraction: 1,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 9.0,
                  height: 9.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : const Color(0xFF2D68AE))
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),

          //FITUR EUY
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const FormTicket();
                        },
                      ));
                    },
                    child: Container(
                      height: 72,
                      width: 72,
                      // ignore: prefer_const_constructors
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50),
                        image: const DecorationImage(
                          fit: BoxFit.none,
                          // ignore: prefer_const_constructors
                          image: AssetImage("assets/images/formtiket1.png"),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Form Tiket',
                    style: TextStyle(color: Colors.black),
                  ),
                  // GestureDetector(onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const form_tiket(),
                  //     ),
                  //   );
                  // }),
                ],
              ),
              const SizedBox(width: 50),
              Column(
                children: [
                  Container(
                    height: 72,
                    width: 72,
                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50),
                        // ignore: prefer_const_constructors
                        image: DecorationImage(
                            fit: BoxFit.none,
                            // ignore: prefer_const_constructors
                            image: const AssetImage(
                                "assets/images/jalurlokasi1.png"))),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Jalur Lokasi',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ],
          ),

          //PROMO
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Color.fromARGB(255, 231, 231, 231),
                  width: 2.0,
                ),
                top: BorderSide(
                  color: Color.fromARGB(255, 231, 231, 231),
                  width: 2.0,
                ),
              ),
            ),
            child: Column(
              children: [
                const Text(
                  "Info dan Promo Spesial",
                  style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                  items: imagespromo
                      .map(
                        (item) => Container(
                          margin: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                            child: Stack(
                              children: <Widget>[
                                Image.network(
                                  item,
                                  fit: BoxFit.cover,
                                  width: 1000.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),

          //ALAMAT
          const SizedBox(height: 20),
          Container(
            height: 270,
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Color.fromARGB(255, 231, 231, 231),
                  width: 2.0,
                ),
                top: BorderSide(
                  color: Color.fromARGB(255, 231, 231, 231),
                  width: 2.0,
                ),
              ),
            ),
            child: Column(
              children: [
                const Text(
                  "Lokasi Sumber Maron",
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 185,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: const CameraPosition(
                      target: _center,
                      zoom: 11,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.import_contacts), label: 'Tiket'),
          BottomNavigationBarItem(icon: Icon(Icons.account_box), label: 'Akun')
        ],
      ),
    );
  }
}
