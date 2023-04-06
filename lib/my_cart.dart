import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_cart/get_takoletas.dart';

import 'package:flutter_cart/total_page.dart';
import 'package:flutter_cart/controllers/takao_test_controller.dart';
import 'package:get/get.dart';
import 'my_cart_item.dart';
import 'package:flutter_cart/helpers/HTTPHelper.dart';

class MyCart extends StatelessWidget {
  MyCart({super.key});
  final TakaoTestController takaoTestController = TakaoTestController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: Image.asset('assets/images/camiseta.jpg'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Camiseta',
                  style: TextStyle(fontSize: 30, color: Colors.black87),
                )
              ],
            ),
            CartItem(
              price: 10,
            ),
            GetTakoletas(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 185,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.redAccent,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () async {
                      Map<String, int> dataToUpdate = {
                        'id': Random().nextDouble().toInt(),
                        'quantidade': takaoTestController.quantity.value,
                        'takoletasUsada': takaoTestController.sum,
                      };
                      bool status = await HTTPHelper().addItem(dataToUpdate);
                      if (status) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Takoletas trocadas')));
                        Get.to(() => TotalPage());
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Falha ao trocar takoletas')));
                      }
                    },
                    child: Text(
                      "Trocar Takoletas",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
