import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_a_camping/models/persion_model.dart';
import 'package:m_a_camping/tools/colors.dart';
import 'package:m_a_camping/tools/constants.dart';
import 'package:m_a_camping/tools/styles.dart';
import 'package:m_a_camping/utils/screens.dart';
import 'package:m_a_camping/widgets/background_widget.dart';

import 'register_logic.dart';

class RegisterPage extends StatelessWidget {
  static const String id = '/register_page';

  final registerLogic = Get.put(RegisterLogic());
  final GlobalKey<FormState> _formRgtKey = GlobalKey<FormState>();
  String fullNameVi = "",
      schoolVi = "",
      titleVi = "",
      emailVi = "",
      phoneVi = "";
  TextEditingController fullNameCtr = TextEditingController(),
      schoolCtr = TextEditingController(),
      titleCtr = TextEditingController(),
      emailCtr = TextEditingController(),
      phoneCtr = TextEditingController();

  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Image.asset("assets/icons/logo_line.png")),
        actions: [],
      ),
      body: Stack(
        children: [
          BackGroundWgt(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenMobile.width(context) * 0.01,
              vertical: ScreenMobile.width(context) * 0.01,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenMobile.width(context) * 0.05,
                vertical: ScreenMobile.width(context) * 0.05,
              ),
              child: Form(
                key: _formRgtKey,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            /// register title
                            Text(
                              kRegToWinTxt,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ScreenMobile.width(context) * 0.05,
                        ),

                        /// full name field
                        TextFormField(
                          controller: fullNameCtr,
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
                          controller: schoolCtr,
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
                          controller: titleCtr,
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
                          controller: emailCtr,
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
                            } else if (GetUtils.isEmail(value)) {
                            } else {
                              return 'This field is required ';
                            }
                          },
                        ),
                        SizedBox(
                          height: ScreenMobile.width(context) * 0.05,
                        ),

                        /// Phone Number field
                        TextFormField(
                          controller: phoneCtr,
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

                        /// Register Form
                        ElevatedButton(
                          onPressed: () {
                            if (_formRgtKey.currentState!.validate()) {
                              print("Register valid ");
                              registerLogic.sendRegisterForm(
                                PersonModel(
                                    nameFull: fullNameCtr.text,
                                    schoolDistract: schoolCtr.text,
                                    title: titleCtr.text,
                                    phoneNumber: phoneCtr.text,
                                    email: emailCtr.text),
                              );
                              Get.back();
                            } else {
                              print("vaild error");
                            }
                          },
                          child: Text(
                            kRegToWinTxt,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: kLightPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8), // <-- Radius
                            ),
                          ),
                        )
                      ],
                    ),
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
