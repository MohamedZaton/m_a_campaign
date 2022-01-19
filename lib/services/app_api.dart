import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:m_a_camping/models/home_item_model.dart';
import 'package:m_a_camping/models/persion_model.dart';
import 'package:m_a_camping/tools/api_keys.dart';
import 'package:http/http.dart' as http;

class AppApi {
  static Future<bool> sendRegisterFormAPI(PersonModel personModel) async {
    final url =
        'https://www.macomp.com/index.php/wp-json/gf/v2/forms/33/entries';
    String username = kConsumerKey;
    String password = kConsumerSecret;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var data = personModel.toJson();

    print(basicAuth);

    final response =
        await http.post(Uri.parse(url), body: jsonEncode(data), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'authorization': basicAuth,
    });
    if (response.statusCode == 200) {
      print(response.body);
      print("Send Form : error code ${response.statusCode.toString()}");
      return true;
    } else {
      print("saved Form : error code ${response.statusCode.toString()}");
      return true;
    }
  }

  static Future<List<HomeItemModel>> fetchHomeItems() async {
    String jsonContent =
        await rootBundle.loadString('assets/local_data/mail_shots_data.json');
    List<dynamic> jsonData = json.decode(jsonContent);
    List<HomeItemModel> items = HomeItemModel.getListObject(jsonData);
    return items;
  }
}
