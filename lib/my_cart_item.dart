import 'package:flutter/material.dart';
import 'package:flutter_cart/controllers/takao_test_controller.dart';
import 'package:get/get.dart';

class CartItem extends StatefulWidget {
  CartItem({
    required this.price,
  });

  final int price;

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  final TakaoTestController takaoTestController = Get.put(TakaoTestController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.black54),
          child: IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  takaoTestController.increment(widget.price);
                });
              }),
        ),
        SizedBox(width: 10),
        Container(
          width: 20,
          height: 50,
          margin: EdgeInsets.all(10),
          child: Obx(() => Text(
                "${takaoTestController.quantity.toString()}",
                style: TextStyle(
                  fontSize: 40,
                  backgroundColor: Colors.grey,
                ),
              )),
        ),
        SizedBox(width: 10),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.black54),
          child: IconButton(
            icon: Icon(
              Icons.remove,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                takaoTestController.decrement(widget.price);
              });
            },
          ),
        ),
      ],
    );
  }
}
