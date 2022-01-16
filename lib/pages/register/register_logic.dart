import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:m_a_camping/tools/api_keys.dart';

class RegisterLogic extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> sendDemoRegister() async {
    final url =
        'https://www.macomp.com/index.php/wp-json/gf/v2/forms/33/entries';
    String username = kConsumerKey;
    String password = kConsumerSecret;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    // var data = {
    //   'form_id': '1',
    //   '1': enquirie['name'],
    //   '2': enquirie['email'],
    //   '3': enquirie['number'],
    //   '4': enquirie['message']
    // };

    var data = {
      "form_id": "33",
      "1.3": "mohamed flutter",
      "4": "flutter school",
      "7": "title flutter",
      "3": "01211212127",
      "2": "mohamed@flutter.com"
    };

    print(basicAuth);
    final response =
        await http.post(Uri.parse(url), body: jsonEncode(data), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'authorization': basicAuth,
    });
    if (response.statusCode != 201) {
      throw Exception('error');
    }
    print(response.body);
  }
}
