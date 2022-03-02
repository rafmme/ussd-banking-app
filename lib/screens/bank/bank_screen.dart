import 'package:flutter/material.dart';
import 'package:ussd_app/helpers/constants.dart';
import 'package:ussd_app/helpers/widgets_builder.dart';
import 'package:ussd_app/models/bank.dart';
import 'package:ussd_app/widgets/bank_page/bank_page_widget.dart';

class BankScreen extends StatelessWidget {
  const BankScreen({Key? key, required this.bank}) : super(key: key);

  final Bank bank;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bank.color,
      appBar: AppBar(
        backgroundColor: bank.color,
        elevation: 0,
        iconTheme: const IconThemeData(color: kHomeScreenAppBarIconColor),
        title: Row(
          children: [
            Text(
              ' ${bank.name}',
              style: const TextStyle(
                color: kHomeScreenAppBarIconColor,
                fontSize: 24,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.info_outline_rounded),
              onPressed: () {
                CreateWidget.displayDialog(
                    context,
                    bank.bankInfo,
                    '${bank.name} Info',
                    CreateWidget.buildDialogButton(
                        context: context, isInfoDialog: true));
              },
            )
          ],
        ),
      ),
      body: BankScreenWidget(
        bank: bank,
      ),
    );
  }
}
