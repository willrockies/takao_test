// ignore_for_file: file_names
import 'dart:convert';

import 'package:http/http.dart' as http;

class HTTPHelper {
  Future<bool> addItem(Map data) async {
    bool status = false;
   

    //Add the item to the database, call the API
    
    http.Response response = await http.post(
        Uri.parse('http://my-json-server.typicode.com/willrockies/takaodb/order'),
        body: jsonEncode(data),
        headers: {'Content-type': 'application/json'});

    if (response.statusCode == 201) {
      status = response.body.isNotEmpty;
    }

    return status;
  }
}
