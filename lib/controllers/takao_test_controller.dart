import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TakaoTestController extends GetxController {
  
  var quantity = 0.obs;
  var totalDeTakoletas = 3000.obs;
  var precoCamisa = 10;

  int get sum => totalDeTakoletas.value;
  int get takoletasUsada => (precoCamisa * quantity.value);
  
  void increment(int price) {
    totalDeTakoletas.value-=price;
    quantity++;
  }

  void decrement(int price) {
    if (quantity.value <= 0) {
      Get.snackbar("Erro", "Quantidade inválida",
          icon: Icon(Icons.error),
          barBlur: 20,
          isDismissible: true,
          duration: Duration(seconds: 3));
    } else {
      totalDeTakoletas.value+=price;
      quantity--;
    }
  } 
}
