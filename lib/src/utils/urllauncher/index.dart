import 'package:flutter/material.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

class URLLauncher {
  static Future openLink({@required String url}) => _launchURL(url);

  static Future _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  static Future openEmail(
      {List<String> toEmail, String subject, String body}) async {
    final url = Mailto(
      to: toEmail,
      subject: subject,
      body: body,
    );
    await _launchURL('$url');
  }

  static Future openCall({@required String phone}) async {
    await _launchURL('tel://$phone');
  }
}
