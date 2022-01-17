import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_a_camping/tools/colors.dart';
import 'package:m_a_camping/tools/constants.dart';
import 'package:m_a_camping/tools/styles.dart';
import 'package:m_a_camping/utils/screens.dart';

import 'register_logic.dart';

class RegisterPage extends StatelessWidget {
  static const String id = '/register_page';

  final register_logic = Get.put(RegisterLogic());
  final GlobalKey<FormState> _formRgtKey = GlobalKey<FormState>();

  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage("assets/images/main_bkgd.png"),
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenMobile.width(context) * 0.05,
              vertical: ScreenMobile.width(context) * 0.09,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenMobile.width(context) * 0.05,
                vertical: ScreenMobile.width(context) * 0.05,
              ),
              child: Form(
                key: _formRgtKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        /// register title
                        Text(
                          kRegisterTxt,
                          style: kTitleTextStyle.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenMobile.width(context) * 0.05,
                    ),

                    /// full name field
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        hintText: kFullNameTxt,
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required ';
                        }
                      },
                    ),
                    SizedBox(
                      height: ScreenMobile.width(context) * 0.05,
                    ),

                    /// School field
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: kSchoolTxt,
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: ScreenMobile.width(context) * 0.05,
                    ),

                    /// Title field
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: kTitleTxt,
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: ScreenMobile.width(context) * 0.05,
                    ),

                    /// email field
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: kEmailTxt,
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required ';
                        }
                      },
                    ),
                    SizedBox(
                      height: ScreenMobile.width(context) * 0.05,
                    ),

                    /// Phone Number field
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: kPhoneNumberTxt,
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required ';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: ScreenMobile.width(context) * 0.05,
                    ),

                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        kRegisterTxt,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: kOrangeColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // <-- Radius
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
