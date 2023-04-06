import 'package:flutter/material.dart';
import 'package:flutter_cart/controllers/takao_test_controller.dart';
import 'package:get/get.dart';

class GetTakoletas extends StatefulWidget {
  const GetTakoletas({super.key});

  //GetTakoletas({required this.price});
  //final int price;
  @override
  State<GetTakoletas> createState() => _GetTakoletasState();
}

class _GetTakoletasState extends State<GetTakoletas> {
  final TakaoTestController takaoTestController = Get.put(TakaoTestController());
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Obx(() => Text("${takaoTestController.totalDeTakoletas.value} Takoletas")),
        ),
      ],
    );
  }
}
