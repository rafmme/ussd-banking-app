import 'package:contact_picker/contact_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ussd_app/data/sql_helper.dart';
import 'package:ussd_app/models/receipient.dart';

class Util {
  static void dialUssdCode({
    required String ussdCode,
  }) async {
    try {
      final String url = formatUssdCode(ussdCode);

      if (await canLaunch(url)) {
        await launch(url);
      }
    } catch (e) {
      throw 'Unable to dial ussd code $ussdCode';
    }
  }

  static void saveUssdTransaction({
    required String ussdCode,
    String? bankName,
    String? bankImage,
    String? receipient,
    String? amount,
    String? ussdAction,
  }) async {
    try {
      final String url = formatUssdCode(ussdCode);

      await SQLHelper.addUSSDTransaction(
        bankName: bankName!,
        bankImage: bankImage!,
        receipient: receipient!,
        amount: amount!,
        ussdAction: ussdAction!,
        ussdCode: url,
      );
    } catch (e) {
      throw 'Unable to save $ussdAction transaction';
    }
  }

  static String formatUssdCode(String ussdCode) {
    // ignore: unnecessary_string_escapes
    final String formatedUssdCode =
        ussdCode.replaceAll(',', '').replaceAll(RegExp(r'#'), '\%23');
    final String url = 'tel:$formatedUssdCode';
    return url;
  }

  static String formatUssdActionCode({
    required String ussdCode,
    required String amount,
    required String receipient,
  }) {
    return ussdCode
        .replaceFirst('amount', amount)
        .replaceFirst('phoneNumber', receipient)
        .replaceFirst('accountNumber', receipient)
        .replaceFirst('decoderNumber', receipient)
        .replaceFirst('smartCardNumber', receipient)
        .replaceFirst('refNumber', receipient)
        .replaceFirst('merchantCode', receipient)
        .replaceFirst('customerID', receipient);
  }

  static String formatUssdActionCodeForAmountOnly({
    required String ussdCode,
    required String amount,
  }) {
    return ussdCode
        .replaceFirst('amount', amount)
        .replaceFirst('accountNumber', amount)
        .replaceFirst('phoneNumber', amount)
        .replaceFirst('smartCardNumber', amount)
        .replaceFirst('bvn', amount)
        .replaceFirst('refNumber', amount);
  }

  static String formatUssdActionCodeForElectricityBillPayment({
    required String ussdCode,
    required String amount,
    required String discoCode,
    String? meterNumber,
  }) {
    if (meterNumber != null) {
      return ussdCode
          .replaceFirst('amount', amount)
          .replaceFirst('meterNumber', meterNumber)
          .replaceFirst('code', discoCode);
    }

    return ussdCode
        .replaceFirst('amount', amount)
        .replaceFirst('code', discoCode);
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

  static String formatPhoneNumber(String rawNumber) {
    if (rawNumber.startsWith('+234')) {
      return rawNumber.replaceFirst('+234', '0');
    }

    return rawNumber;
  }

  static String formatAmount(String amount) {
    return amount.split('.')[0].replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }
}
