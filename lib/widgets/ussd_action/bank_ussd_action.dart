import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ussd_app/helpers/util.dart';
import 'package:ussd_app/helpers/widgets_builder.dart';
import 'package:ussd_app/models/bank.dart';

class BankUssdActionWidget extends StatelessWidget {
  const BankUssdActionWidget({
    Key? key,
    required this.bank,
    required this.ussdActionData,
    required this.index,
  }) : super(key: key);

  final Bank bank;
  final Map<String, dynamic> ussdActionData;
  final int index;

  @override
  Widget build(BuildContext context) {
    final String? ussdAction = ussdActionData['action'];
    final String? ussdCode = ussdActionData['code'];
    final String? ussdShowText = ussdActionData['showText'];

    return Card(
      elevation: 1.5,
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        onLongPress: () {
          Clipboard.setData(ClipboardData(text: ussdCode)).then(
            (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 1),
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
        leading: CircleAvatar(
          backgroundColor: bank.color,
          child: Text(
            '${index + 1}',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          foregroundColor: bank.color,
        ),
        title: Text(
          ussdAction!,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        trailing: SizedBox(
          width: 74,
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: bank.color,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Icon(
                Icons.call,
                color: bank.color,
              ),
            ],
          ),
        ),
        onTap: () {
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
                bankName: bank.name,
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
              bankName: bank.name,
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
              bankName: bank.name,
            );
            return;
          }

          Util.dialUssdCode(ussdCode: ussdCode!);
        },
      ),
    );
  }
}
