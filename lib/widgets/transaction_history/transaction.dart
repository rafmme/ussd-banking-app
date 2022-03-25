import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ussd_app/data/sql_helper.dart';
import 'package:ussd_app/helpers/constants.dart';
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

  void _executeUSSDCode({
    required context,
    required String ussdCode,
    required String ussdAction,
    required String details,
  }) {
    CreateWidget.displayDialog(
        context,
        'Action: $ussdAction\n\nDetails: $details',
        'Confirmation',
        CreateWidget.buildDialogButton(
          context: context,
          isInfoDialog: false,
          ussdCode: ussdCode,
          dontSave: true,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final String details = "${transaction['amount']}".isNotEmpty &&
            "${transaction['receipient']}".isNotEmpty
        ? '${transaction['amount']} | ${transaction['receipient']}'
        : "${transaction['amount']}".isEmpty
            ? "${transaction['receipient']}"
            : "${transaction['amount']}";

    final String ussdCode = '${transaction['ussdCode']}'.replaceAll('tel:', '');
    final String ussdAction = '${transaction['ussdAction']}';

    return Card(
      elevation: 1.618,
      margin: const EdgeInsets.only(left: 17, right: 17, bottom: 8),
      child: Slidable(
        child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          onTap: () {
            _executeUSSDCode(
              context: context,
              ussdCode: ussdCode,
              ussdAction: ussdAction,
              details: details,
            );
          },
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
                    duration: const Duration(seconds: 1),
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
            ),
          ),
        ),
        endActionPane: ActionPane(
          extentRatio: 0.35,
          motion: Container(
            decoration: const BoxDecoration(color: kUssdActionCardBg),
            child: Row(
              children: [
                IconButton(
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
                  icon: const Icon(
                    Icons.delete_forever_sharp,
                    color: Colors.red,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _executeUSSDCode(
                      context: context,
                      ussdCode: ussdCode,
                      ussdAction: ussdAction,
                      details: details,
                    );
                  },
                  icon: const Icon(Icons.call_sharp),
                  color: kHoomeScreenAppBarColor,
                ),
              ],
            ),
          ),
          children: const [],
        ),
      ),
    );
  }
}
