import 'package:contact_picker/contact_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ussd_app/models/receipient.dart';

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

  static Future<Receipient> importContact() async {
    final ContactPicker _contactPicker = ContactPicker();
    Contact contact = await _contactPicker.selectContact();

    if (contact != null) {
      return Receipient(
        name: contact.fullName,
        number: contact.phoneNumber.number,
      );
    }

    return Receipient(name: '', number: '');
  }
}
