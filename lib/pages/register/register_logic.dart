import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:m_a_camping/models/persion_model.dart';
import 'package:m_a_camping/services/app_api.dart';
import 'package:m_a_camping/tools/api_keys.dart';
import 'package:m_a_camping/tools/constants.dart';
import 'package:m_a_camping/utils/Local_Hive.dart';
import 'package:m_a_camping/utils/send_mails_util.dart';

class RegisterLogic extends GetxController {

  @override
  Future<void> onReady() async {



    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    print("getx register onClose") ;

    super.onClose();
  }

  Future<void> sendRegisterForm(PersonModel personModel) async {
    bool isSent ;
    try {
       isSent = await AppApi.sendRegisterFormAPI(personModel);
    } catch (e) {
      print("error send register " + e.toString());
      isSent =false ;
    }

    if (isSent) {
      // online send
      SendMailsUtil.sendRegistrationNotification(personModel.email) ;
      Get.snackbar("Register Form", "Success Submit",icon: Icon(Icons.check_circle,color: Colors.green,),);
    } else {
      // offline send‼

      Get.snackbar("Register Form", "Success",icon: Icon(Icons.check_circle,color: Colors.green,),);
    }
  }
}
