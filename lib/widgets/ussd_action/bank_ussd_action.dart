import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ussd_app/helpers/constants.dart';
import 'package:ussd_app/helpers/util.dart';
import 'package:ussd_app/helpers/widgets_builder.dart';
import 'package:ussd_app/models/bank.dart';

class BankUssdActionWidget extends StatelessWidget {
  const BankUssdActionWidget({
    Key? key,
    required this.bank,
    required this.ussdActionData,
  }) : super(key: key);

  final Bank bank;
  final Map<String, dynamic> ussdActionData;

  @override
  Widget build(BuildContext context) {
    final String? ussdAction = ussdActionData['action'];
    final String? ussdCode = ussdActionData['code'];
    final String? ussdShowText = ussdActionData['showText'];

    return GestureDetector(
      onLongPress: () {
        Clipboard.setData(ClipboardData(text: ussdCode)).then(
          (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 8),
                content: Text(
                  "$ussdCode\n\n${bank.name}'s $ussdAction USSD Code has been copied to your clipboard!",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        );
      },
      child: GridTile(
          child: TextButton(
        onPressed: () {
          if (ussdActionData['dialUp'] != null &&
              ussdActionData['amo'] != null) {
            if (ussdActionData['electricity'] != null) {
              CreateWidget.createModalBottomSheet(
                context: context,
                ussdAction: ussdAction,
                ussdCode: ussdCode,
                image: bank.image,
                amo: false,
                electricityBill: ussdActionData['electricity'],
                discoCodes: ussdActionData['disco'],
              );
              return;
            }

            CreateWidget.createModalBottomSheet(
              context: context,
              ussdAction: ussdAction,
              ussdCode: ussdCode,
              image: bank.image,
              amo: false,
              ussdShowText: ussdShowText,
            );
            return;
          } else if (ussdActionData['dialUp'] != null) {
            CreateWidget.createModalBottomSheet(
              context: context,
              ussdAction: ussdAction,
              ussdCode: ussdCode,
              image: bank.image,
              amo: true,
              ussdShowText: ussdShowText,
            );
            return;
          }

          Util.dialUssdCode(ussdCode!);
        },
        child: SizedBox(
          width: 200,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: kUssdActionCardBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 3, right: 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Icon(
                      Icons.call,
                      color: bank.color,
                    ),
                  ),
                  Center(
                    child: Text(
                      ussdAction!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
