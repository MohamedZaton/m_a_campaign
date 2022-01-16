import 'package:http/http.dart' as http;
import 'package:m_a_camping/tools/api_keys.dart';

class SendGridUtil {
  static sendRegistrationNotification(String email) async {
    Map<String, String> headers = new Map();
    //headers["Authorization"] = "Bearer SENDGRIDAPIKEY";
    headers["Authorization"] = "Bearer $kSendGridKey";
    headers["Content-Type"] = "application/json";

    const String urlSTr = 'https://api.sendgrid.com/v3/mail/send';
    var response = await http.post(Uri.parse(urlSTr),
        headers: headers,
        body:
            "{\n          \"personalizations\": [\n            {\n              \"to\": [\n                {\n                  \"email\": \"jerrod@liftaixxx.com\"\n                },\n                {\n                  \"email\": \"darran@gmailxxx.com\"\n                }\n              ]\n            }\n          ],\n          \"from\": {\n            \"email\": \"app@liftaixxx.com\"\n          },\n          \"subject\": \"New user registration\",\n          \"content\": [\n            {\n              \"type\": \"text\/plain\",\n              \"value\": \"New user register: $email\"\n            }\n          ]\n        }");
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
