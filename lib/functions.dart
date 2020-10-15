import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class Functions {
  url_Launcher(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        debugPrint("cant launch");
      }
    } catch (e) {
      debugPrint(e.message);
    }
  }
}
