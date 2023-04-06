import 'package:flutter/material.dart';
import 'package:flutter_cart/my_cart.dart';
import 'package:get/get.dart';

import 'controllers/takao_test_controller.dart';

class TotalPage extends StatelessWidget {
  TotalPage({super.key});
  final TakaoTestController takaoTestController =
      Get.put(TakaoTestController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Total de takoletas",
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(() => Text(
                  "Você tem ${takaoTestController.sum.toString()} takoletas e foi usada ${takaoTestController.takoletasUsada.toString()} Takoletas",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.redAccent,
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.redAccent,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () => Get.back(),
                child: Text(
                  "Retornar",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
