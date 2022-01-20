import 'dart:convert';
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
    headers["Authorization"] = "Bearer $kSendGridKey";
    headers["Content-Type"] = "application/json";
    final bodyJ = {
      "personalizations": [
        {
          "to": [
            {"email": "superzaton74@gmail.com", "name": "Mohamed"}
          ],
          "subject": "Hello, World!"
        }
      ],
      "content": [
        {"type": "text/plain", "value": "Heya!"}
      ],
      "from": {"email": "mohamed.hassan.1993y@gmail.com", "name": "mohamed"},
      "reply_to": {"email": "mohamed.hassan.1993y@gmail.com", "name": "mohamed"}
    };
    const String urlSTr = 'https://api.sendgrid.com/v3/mail/send';
    var response = await http.post(Uri.parse(urlSTr),
        headers: headers, body: json.encode(bodyJ));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  static sendSmtpGmail(String sendTo, String htmlLink) async {
    final smtpServer = gmail(kMail, kPwd);
    // Use the SmtpServer class to configure an SMTP server:
    // final smtpServer = SmtpServer('smtp.domain.com');
    // See the named arguments of SmtpServer for further configuration
    // options.

    bool isMailShot = htmlLink.contains("html");
    // Create our message.
    final message = Message()
      ..from = Address(kMail, 'M&A Technology')
      ..recipients.add(sendTo)
      // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
      // ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = '(Testing) Mail from smartphone app '
      ..text = isMailShot
          ? ''
          : 'this is a website you liked on our site\n ${htmlLink} '
      ..html = isMailShot ? await rootBundle.loadString(htmlLink) : null;

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
