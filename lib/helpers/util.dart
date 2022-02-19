import 'package:url_launcher/url_launcher.dart';

class Util {
  static void dialUssdCode(String ussdCode) async {
    try {
      // ignore: unnecessary_string_escapes
      final String formatedUssdCode = ussdCode.replaceAll(RegExp(r'#'), '\%23');
      final String url = 'tel:$formatedUssdCode';

      if (await canLaunch(url)) {
        await launch(url);
      }
    } catch (e) {
      throw 'Unable to dial ussd code $ussdCode';
    }
  }
}
