// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:lecture_one/model/customer.mode.dart';

class FirebaseService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  final Map<String, String> _headers = {'Content-Type': 'application/json'};
  final Uri url = Uri.https(
      'flutter-app-4fa34-default-rtdb.firebaseio.com', 'customer.json');

  Future<void> saveCustomer(Object data) async {
    try {
      final response =
          await http.post(url, headers: _headers, body: json.encode(data));
      if (response.statusCode == 200) {}
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<Customer>> getCustomers() async {
    try {
      final response = await http.get(url, headers: _headers);
      Map<String, dynamic> jsonData = json.decode(response.body);
      jsonData = jsonData as Map<String, dynamic>;

      final List<Customer> customers = [];
      for (final customer in jsonData.entries) {
        customers.add(Customer(
            customer.key,
            customer.value['name'] ?? '',
            customer.value['address'] ?? '',
            customer.value['phone'] ?? '',
            customer.value['email'] ?? ''));
      }
      return customers;
    } catch (e) {
      throw e.toString();
    }
  }
}
