import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_a_camping/models/persion_model.dart';
import 'package:m_a_camping/tools/colors.dart';
import 'package:m_a_camping/tools/constants.dart';
import 'package:m_a_camping/tools/styles.dart';
import 'package:m_a_camping/utils/screens.dart';
import 'package:m_a_camping/widgets/background_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
        title: Center(
            child: Image.asset(
          "assets/icons/logo_line_2.png",
          scale: 5,
        ),),
        actions: [],
      ),
      body: Stack(
        children: [
          BackGroundWgt(
            imageBgPath: "assets/images/main_bkgd_3.png",
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenMobile.width(context) * 0.01,
              vertical: ScreenMobile.width(context) * 0.05,
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
                                  ?.copyWith(
                                      color: kLightPrimary,
                                      fontWeight: FontWeight.bold),
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
                          decoration: InputDecoration(
                            hintText: kFullNameTxt,
                            fillColor: Colors.white,
                            filled: true,
                            border: const OutlineInputBorder(),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5), // add padding to adjust icon
                              child: Image.asset(
                                'assets/icons/name_1.png',
                                width: 1,
                                height: 1,
                              ),
                            ),
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
                          decoration: InputDecoration(
                            hintText: kSchoolTxt,
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5), // add padding to adjust icon
                              child: Image.asset(
                                'assets/icons/school_1.png',
                                width: 1,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenMobile.width(context) * 0.05,
                        ),

                        /// Title field
                        TextFormField(
                          controller: titleCtr,
                          decoration: InputDecoration(
                            hintText: kTitleTxt,
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5), // add padding to adjust icon
                              child: Image.asset(
                                'assets/icons/title_1.png',
                                width: 1,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenMobile.width(context) * 0.05,
                        ),

                        /// email field
                        TextFormField(
                          controller: emailCtr,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: kEmailTxt,
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5), // add padding to adjust icon
                              child: Image.asset(
                                'assets/icons/mail_1.png',
                                width: 1,
                                height: 1,
                              ),
                            ),
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
                          decoration: InputDecoration(
                            hintText: kPhoneNumberTxt,
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5), // add padding to adjust icon
                              child: Image.asset(
                                'assets/icons/phone_1.png',
                                width: 1,
                                height: 1,
                              ),
                            ),
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
                        Wrap(children: [ Text(kRegisterText,textAlign: TextAlign.center,style:TextStyle(color:kDarkGray ,fontWeight: FontWeight.bold),),]),
                        SizedBox(
                          height: ScreenMobile.width(context) * 0.01,
                        ),
                        Wrap(children: [ Text("www.linkedin.com/company/m&a-technology/",textAlign: TextAlign.center,style:TextStyle(color: kLightPrimary ,fontWeight: FontWeight.bold),),]),
                        SizedBox(
                          height: ScreenMobile.width(context) * 0.02,
                        ),
                        QrImage(
                          data: "https://www.linkedin.com/company/m&a-technology/",
                          version: QrVersions.auto,
                          size: 150.0,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          height: ScreenMobile.width(context) * 0.02,
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
