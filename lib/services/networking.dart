import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NetWorkingService {
  NetWorkingService(this.url);

  final String url;

  Future getWeatherData() async {
    Response response = await get(Uri.parse(url));
    // response.body returns as a string and needs to be converted to Json/dict format
    if (response.statusCode == 200) {
      var dataAsJson = jsonDecode(response.body);
      return dataAsJson;
    } else {
      print(response.statusCode);
    }
  }
}
