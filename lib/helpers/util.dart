import 'dart:io';

import 'package:contact_picker/contact_picker.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:intent/action.dart' as android_action;
import 'package:intent/intent.dart' as android_intent;
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ussd_app/data/sql_helper.dart';
import 'package:ussd_app/models/receipient.dart';

class Util {
  static void openUrl(LinkableElement link) async {
    try {
      if (await canLaunch(link.url)) {
        await launch(link.url);
      }
    } catch (e) {
      throw 'Unable to launch ${link.url}';
    }
  }

  static void requestPhoneContactsAccessPermission() async {
    final status = await Permission.contacts.status;

    if (status.isDenied) {
      await Permission.contacts.request();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  static void requestPhoneCallAccessPermission() async {
    final status = await Permission.phone.status;

    if (status.isDenied) {
      await Permission.phone.request();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  static void dialUssdCode({
    required String ussdCode,
  }) async {
    try {
      requestPhoneCallAccessPermission();
      final String url = formatUssdCode(ussdCode);

      if (Platform.isAndroid) {
        android_intent.Intent()
          ..setAction(android_action.Action.ACTION_CALL)
          ..setData(Uri(scheme: 'tel', path: url.replaceAll('tel:', '')))
          ..startActivity();
        return;
      }

      if (await canLaunch(url)) {
        await launch(url);
      }
    } catch (e) {
      throw 'Unable to dial ussd code $ussdCode';
    }
  }

  static void shareUSSDCode({
    required String bankName,
    required String ussdCode,
    required String ussdAction,
  }) {
    FlutterShare.share(
      title: "$bankName's $ussdAction USSD Code",
      text:
          "$bankName's $ussdAction USSD Code\n\n$ussdCode\n\n~ NG USSD Banking App",
      linkUrl:
          'Download from: https://github.com/rafmme/ng-ussd-banking-app/releases/download/v1.0.0/ng-ussd-banking-app.apk',
    );
  }

  static Future<int> saveUssdTransaction({
    required String ussdCode,
    String? bankName,
    String? bankImage,
    String? receipient,
    String? amount,
    String? ussdAction,
  }) async {
    try {
      final String url = formatUssdCode(ussdCode);

      return await SQLHelper.addUSSDTransaction(
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
    requestPhoneContactsAccessPermission();

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
