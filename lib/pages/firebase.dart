import 'package:card_demo_package/card_demo_package.dart';
import 'package:css_colors/css_colors.dart';
import 'package:flutter/material.dart';
import 'package:lecture_one/firebase/firebase.service.dart';
import 'package:lecture_one/model/customer.mode.dart';
import 'package:lecture_one/pages/modal/addCustomer.modal.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path/path.dart' as p;

class FirebasePage extends StatefulWidget {
  const FirebasePage({super.key});

  @override
  State<FirebasePage> createState() => _FirebasePageState();
}

class _FirebasePageState extends State<FirebasePage> {
  final FirebaseService _firebaseService = FirebaseService();
  List<Customer> _customers = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    final customers = await _firebaseService.getCustomers();
    setState(() {
      _customers = customers;
    });
  }

  Future<void> _launchUrl() async {
    final Uri _url = Uri.parse('https://www.google.com/');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              const Text('Customers', style: TextStyle(color: CSSColors.white)),
          backgroundColor: CSSColors.blueViolet,
          elevation: 2.5,
          actions: [
            GestureDetector(
                child: const Icon(Icons.link, color: CSSColors.white),
                onTap: () {
                  _launchUrl();
                }),
            GestureDetector(
              child: const Icon(Icons.add, size: 30, color: CSSColors.white),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AddCustomerDialog();
                    }).then((value) {
                  getData();
                });
              },
            )
          ]),
      body: Container(
          decoration: const BoxDecoration(color: CSSColors.blueViolet),
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
              itemCount: _customers.length,
              itemBuilder: (context, index) {
                final Customer customer = _customers[index];
                return CustomCard(
                  color: const Color.fromARGB(255, 184, 129, 235),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(children: [
                          const Text('Name:',
                              style: TextStyle(
                                  fontSize: 15, color: CSSColors.white)),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(customer.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: CSSColors.white)),
                          ),
                        ]),
                        Row(children: [
                          const Text('Address:',
                              style: TextStyle(
                                  fontSize: 15, color: CSSColors.white)),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(customer.address,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: CSSColors.white)),
                          ),
                        ]),
                        Row(children: [
                          const Text('Phone No:',
                              style: TextStyle(
                                  fontSize: 15, color: CSSColors.white)),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(customer.phoneNo,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: CSSColors.white)),
                          ),
                        ]),
                        Row(children: [
                          const Text('Email:',
                              style: TextStyle(
                                  fontSize: 15, color: CSSColors.white)),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(customer.email,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: CSSColors.white)),
                          ),
                        ]),
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
