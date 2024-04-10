import 'dart:convert';

import 'package:http/http.dart';

class DataServices {
  String baseUrl = "http://mark.bslmeiyu.com/api";
  getInfo() async {
    var apiUrl = '/getplaces';
    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));

    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.bady);
      }
    } catch (e) {
      print(e);
    }
  }
}
