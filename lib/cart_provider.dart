import 'package:flutter/material.dart';

class Cartprovider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];

  void addproduct(Map<String, dynamic> product) {
    cart.add(product);
  }

  void removeproduct(Map<String, dynamic> product) {
    cart.remove(product);
  }
}
