import 'dart:convert';
import 'package:http/http.dart' as http;

class TwilioHTTP {
  Future<void> sendSMS(String toNum, String userName) async {
    var uname = 'AC94fd0ad565bea1041a58c8c795b5f83f';
    var pword = 'e431092651a26f3e7f952ad9bea83aa8';
    var authn = 'Basic ${base64Encode(utf8.encode('$uname:$pword'))}';

    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': authn,
    };

    var data = {
      'To': '+916309162118',
      'From': '+16066174808',
      'MessagingServiceSid': 'AC94fd0ad565bea1041a58c8c795b5f83f',
      'Body': 'Medicine taken by {$userName}',
    };

    var url = Uri.parse(
        'https://api.twilio.com/2010-04-01/Accounts/AC94fd0ad565bea1041a58c8c795b5f83f/Messages.json');
    var res = await http.post(url, headers: headers, body: data);
    if (res.statusCode != 200) {
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    }
  }
}
