import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ussd_app/data/sql_helper.dart';
import 'package:ussd_app/helpers/widgets_builder.dart';

class Transaction extends StatelessWidget {
  const Transaction({
    Key? key,
    required this.transaction,
    required this.refreshTransactionList,
  }) : super(key: key);

  final Map<String, dynamic> transaction;
  final Function refreshTransactionList;

  void _deleteTransaction(int id) async {
    await SQLHelper.deleteUSSDTransaction(id);
    refreshTransactionList();
  }

  @override
  Widget build(BuildContext context) {
    final String details = "${transaction['amount']}".isNotEmpty &&
            "${transaction['receipient']}".isNotEmpty
        ? '${transaction['amount']} | ${transaction['receipient']}'
        : "${transaction['amount']}".isEmpty
            ? "${transaction['receipient']}"
            : "${transaction['amount']}";

    return Card(
      elevation: 8,
      margin: const EdgeInsets.only(left: 17, right: 17, bottom: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
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
        leading: Container(
          margin: const EdgeInsets.only(
            top: 20,
          ),
          child: Image.asset(
            "${transaction['bankImage']}",
            width: 30,
            height: 35,
          ),
        ),
        title: Container(
          margin: const EdgeInsets.only(
            top: 20,
          ),
          child: Text(
            '${transaction['ussdAction']}\n${transaction['createdAt']}\n',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        subtitle: Text(
          details,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Column(
          children: [
            SizedBox(
              width: 50,
              height: 30,
              child: TextButton(
                child: const Icon(Icons.call_sharp),
                onPressed: () {
                  CreateWidget.displayDialog(
                      context,
                      'Action: ${transaction['ussdAction']}\n\nDetails: $details',
                      'Confirmation',
                      CreateWidget.buildDialogButton(
                        context: context,
                        isInfoDialog: false,
                        ussdCode:
                            '${transaction['ussdCode']}'.replaceAll('tel:', ''),
                        dontSave: true,
                      ));
                },
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            const Spacer(
              flex: 2,
            ),
            SizedBox(
              width: 50,
              height: 26,
              child: TextButton(
                child: const Icon(
                  Icons.delete_forever_sharp,
                  color: Colors.red,
                ),
                onPressed: () {
                  CreateWidget.displayDialog(
                    context,
                    'This will delete this transaction from your transactions history list on the app\n\nClick Proceed button to continue.',
                    'Confirm Deletion',
                    CreateWidget.buildDialogButton(
                      context: context,
                      isInfoDialog: false,
                      isConfirmation: true,
                      executeFunction: _deleteTransaction,
                      id: transaction['id'],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
