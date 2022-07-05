import 'package:tugas_aas/models/products.dart';
import 'package:tugas_aas/Service/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends ChangeNotifier {
  List<Product> product = [];
  bool isLoading = true;

  HomePage() {
    getData();
  }

  void getData() {
    isLoading = true;
    notifyListeners();
    api.getProducts().then((value) {
      isLoading = false;
      if (value != null) {
        product = value;
      }
      notifyListeners();
    });
  }
}
