import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:m_a_camping/models/persion_model.dart';
import 'package:m_a_camping/services/app_api.dart';
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

  Future<void> sendRegisterForm(PersonModel personModel) async {
    bool isSent = await AppApi.sendRegisterFormAPI(personModel);
    if (isSent) {
      // online send
      Get.snackbar("Register Form", "Success Submit",icon: Icon(Icons.check_circle,color: Colors.green,),);
    } else {
      // offline send‼
      Get.snackbar("Register Form", "Success",icon: Icon(Icons.check_circle,color: Colors.green,),);
    }
  }
}
