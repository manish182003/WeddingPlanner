import 'dart:convert';

import 'package:eternal_tie/User/Home/Models/Venue.dart';
import 'package:eternal_tie/Utility/snackbar.dart';
import 'package:eternal_tie/common/global_variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class HomeServices {
  Future<List<Venue>> getAllVenues(BuildContext context) async {
    List<Venue> venue = [];
    try {
      var res = await http.get(Uri.parse('$url/api/vendor'));

      if (res.statusCode != 200) {
        showSnackBar(context, jsonDecode(res.body)['error']);
      } else {
        var data = jsonDecode(res.body);
        for (int i = 0; i < data.length; i++) {
          venue.add(Venue.fromMap(data[i]));
        }
        return venue;
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return venue;
  }

  launchWhatsapp(BuildContext context, String phone, String message) async {
    try {
      String url = 'https://wa.me/$phone?text=$message';
      if (!await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        showSnackBar(context, 'WhatsApp is not installed.');
      }
    } catch (e) {
      showSnackBar(context, 'Failed to launch WhatsApp: $e');
    }
  }

  launchMessage(BuildContext context, String phone, String message) async {
    try {
      String url = 'sms:$phone?body=$message';
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        showSnackBar(context, 'Something Went Wrong.');
      }
    } catch (e) {
      showSnackBar(context, 'Failed to launch SMS: $e');
    }
  }
}
