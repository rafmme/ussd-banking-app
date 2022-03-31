import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:ussd_app/helpers/constants.dart';
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
    required String bankName,
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
            bankImage: image,
            bankName: bankName,
          )
        : electricityBill != null
            ? ElectricityBillPaymentWidget(
                ussdAction: ussdAction!,
                ussdCode: ussdCode!,
                electricityBill: electricityBill,
                discoCodes: discoCodes!,
                bankImage: image,
                bankName: bankName,
              )
            : ReceipientAmountWidget(
                ussdAction: ussdAction!,
                ussdCode: ussdCode!,
                ussdShowText: ussdShowText,
                bankImage: image,
                bankName: bankName,
              );

    return showModalBottomSheet<void>(
      context: context,
      elevation: 100,
      isDismissible: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(0),
        ),
      ),
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
                      ussdAction.replaceFirst('\n', ' '),
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
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: kFirstBankColor,
              ),
            ),
            content: Linkify(
              text: message,
              style: const TextStyle(fontSize: 19),
              humanize: true,
              onOpen: Util.openUrl,
            ),
            actions: <Widget>[
              Row(
                children: dialogBtn,
              ),
            ],
          );
        });
  }

  static List<Widget> buildDialogButton({
    required BuildContext context,
    required bool isInfoDialog,
    String? ussdCode,
    String? ussdAction,
    String? bankName,
    String? bankImage,
    String? receipient,
    String? amount,
    bool? dontSave,
    bool? isConfirmation,
    Function? executeFunction,
    int? id,
  }) {
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

    if (isInfoDialog == false && isConfirmation == true && id != null) {
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
            executeFunction!(id);
            Navigator.of(context).pop();
          },
          child: const Text(
            'Proceed',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ];
    }

    if (isInfoDialog == false && isConfirmation == true) {
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
            executeFunction!();
            Navigator.of(context).pop();
          },
          child: const Text(
            'Proceed',
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
        onPressed: () async {
          if (dontSave == true) {
            Navigator.of(context).pop();

            Util.dialUssdCode(
              ussdCode: ussdCode!,
            );
            return;
          } else {
            Navigator.of(context).pop();
            Navigator.of(context).pop();

            Util.dialUssdCode(
              ussdCode: ussdCode!,
            );

            await Util.saveUssdTransaction(
              ussdCode: ussdCode,
              bankImage: bankImage,
              bankName: bankName,
              ussdAction: ussdAction,
              receipient: receipient,
              amount: amount,
            );
          }
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
