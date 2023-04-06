import 'dart:ffi';

import 'package:flutter/material.dart';

class Order {
  final String id;
  final int quantity;
  final int takoletasUsada;
  
  Order({
    required this.id,
    required this.quantity,
    required this.takoletasUsada,
  });

}