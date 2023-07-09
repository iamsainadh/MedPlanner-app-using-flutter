import 'package:flutter/material.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class Twilio_SMS extends StatefulWidget {
  const Twilio_SMS({super.key});

  get sendSms => const Twilio_SMS().sendSms;

  @override
  State<Twilio_SMS> createState() => _Twilio_SMSState();
}

class _Twilio_SMSState extends State<Twilio_SMS> {
  late TwilioFlutter twilioFlutter;

  @override
  void initState() {
    super.initState();
    twilioFlutter = TwilioFlutter(
        accountSid: 'AC94fd0ad565bea1041a58c8c795b5f83f',
        authToken: 'e431092651a26f3e7f952ad9bea83aa8',
        twilioNumber: '+16066174808');
  }

  void sendSms() async {
    twilioFlutter.sendSMS(
        toNumber: '+916309162118', messageBody: 'Medicine Taken By Sainadh');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'Click the button to send SMS.',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sendSms,
        tooltip: 'Send Sms',
        child: const Icon(Icons.send),
      ),
    );
  }
}
