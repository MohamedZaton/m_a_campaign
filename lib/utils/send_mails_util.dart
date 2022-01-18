import 'dart:core';

import 'package:http/http.dart' as http;
import 'package:m_a_camping/tools/api_keys.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter/services.dart';

class SendMailsUtil {
  static sendRegistrationNotification(String email) async {
    Map<String, String> headers = new Map();
    //headers["Authorization"] = "Bearer SENDGRIDAPIKEY";
    //  headers["Authorization"] = "Bearer $kSendGridKey";
    headers["Content-Type"] = "application/json";

    const String urlSTr = 'https://api.sendgrid.com/v3/mail/send';
    var response = await http.post(Uri.parse(urlSTr),
        headers: headers,
        body:
            "{\n          \"personalizations\": [\n            {\n              \"to\": [\n                {\n                  \"email\": \"jerrod@liftaixxx.com\"\n                },\n                {\n                  \"email\": \"darran@gmailxxx.com\"\n                }\n              ]\n            }\n          ],\n          \"from\": {\n            \"email\": \"app@liftaixxx.com\"\n          },\n          \"subject\": \"New user registration\",\n          \"content\": [\n            {\n              \"type\": \"text\/plain\",\n              \"value\": \"New user register: $email\"\n            }\n          ]\n        }");
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  static sendSmtpGmail(String sendTo, String htmlLink) async {
    final smtpServer = gmail(kMail, kPwd);
    // Use the SmtpServer class to configure an SMTP server:
    // final smtpServer = SmtpServer('smtp.domain.com');
    // See the named arguments of SmtpServer for further configuration
    // options.

    // Create our message.
    final message = Message()
      ..from = Address(kMail, 'Your name')
      ..recipients.add(sendTo)
      // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
      // ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = await rootBundle.loadString(htmlLink);
    ;

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}
