import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ussd_app/helpers/widgets_builder.dart';

class Transaction extends StatelessWidget {
  const Transaction({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final Map<String, dynamic> transaction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        final String ussdCode = '${transaction['ussdCode']}'
            .replaceAll('tel:', '')
            .replaceAll('%23', '#');

        Clipboard.setData(ClipboardData(
          text: ussdCode,
        )).then(
          (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 8),
                content: Text(
                  "$ussdCode\n\n${transaction['ussdAction']} USSD Code has been copied to your clipboard!",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Card(
          key: ValueKey(transaction['id']),
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
          child: TextButton(
            onPressed: () {
              CreateWidget.displayDialog(
                  context,
                  'Action: ${transaction['ussdAction']}\n\nDetails: ${transaction['receipient']} | ${transaction['amount']}',
                  'Confirmation',
                  CreateWidget.buildDialogButton(
                    context: context,
                    isInfoDialog: false,
                    ussdCode:
                        '${transaction['ussdCode']}'.replaceAll('tel:', ''),
                    dontSave: true,
                  ));
            },
            child: Padding(
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Image.asset(
                        transaction['bankImage'],
                        height: 30,
                        width: 40,
                      ),
                      Column(
                        children: [
                          Text(
                            '${transaction['ussdAction']}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '${transaction['amount']}\n\n${transaction['receipient']}\n',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '${transaction['createdAt']}\n',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              padding:
                  const EdgeInsets.only(left: 2, right: 2, top: 8, bottom: 8),
            ),
          )),
    );
  }
}
