import 'package:flutter/material.dart';
import 'package:ussd_app/helpers/util.dart';
import 'package:ussd_app/widgets/ussd_action/amount_only.dart';
import 'package:ussd_app/widgets/ussd_action/electricity_bill_payment.dart';
import 'package:ussd_app/widgets/ussd_action/receipient_amount.dart';

class CreateWidget {
  static Future<void> createModalBottomSheet({
    required BuildContext context,
    String? ussdAction,
    String? ussdCode,
    required String image,
    required bool amo,
    String? ussdShowText,
    String? electricityBill,
    Map<String, String>? discoCodes,
  }) {
    final Widget ussdActionWidget = amo
        ? AmountOnlyWidget(
            ussdAction: ussdAction!,
            ussdCode: ussdCode!,
            ussdShowText: ussdShowText,
          )
        : electricityBill != null
            ? ElectricityBillPaymentWidget(
                ussdAction: ussdAction!,
                ussdCode: ussdCode!,
                electricityBill: electricityBill,
                discoCodes: discoCodes!,
              )
            : ReceipientAmountWidget(
                ussdAction: ussdAction!,
                ussdCode: ussdCode!,
                ussdShowText: ussdShowText,
              );

    return showModalBottomSheet<void>(
      context: context,
      elevation: 100,
      isDismissible: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(50))),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom + 80),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Image.asset(
                      image,
                      width: 30,
                      height: 20,
                    ),
                    Text(
                      ussdAction,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                ussdActionWidget
              ]),
        );
      },
    );
  }

  static displayDialog(BuildContext context, String message, String title,
      List<Widget> dialogBtn) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Text(
              message,
              style: const TextStyle(fontSize: 19),
            ),
            actions: <Widget>[
              Row(
                children: dialogBtn,
              ),
            ],
          );
        });
  }

  static List<Widget> buildDialogButton(
      {required BuildContext context,
      required bool isInfoDialog,
      String? ussdCode}) {
    if (isInfoDialog == true) {
      return [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'OK',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ];
    }
    return [
      TextButton(
        child: const Text(
          'Cancel',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      const Spacer(),
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          Util.dialUssdCode(ussdCode!);
        },
        child: Row(children: const [
          Icon(
            Icons.phone_outlined,
          ),
          Text(
            'Execute',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ]),
      )
    ];
  }
}
