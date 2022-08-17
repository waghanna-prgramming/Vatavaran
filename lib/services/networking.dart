import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ----------This Class Takes url as input and gives decode data--------------
class NetworkHelper {
  var decodedData;
  String apiUrl = "";

  NetworkHelper(this.apiUrl);

  Future getLocation() async {
    Uri url = Uri.parse(apiUrl);

    http.Response response = await http.get(url);
    // print(response.statusCode);
    if (response.statusCode == 200) {
      String data = response.body;
      decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print("Error Occurred");
    }
  }
}
