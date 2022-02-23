import 'package:flutter/material.dart';
import 'package:ussd_app/helpers/constants.dart';
import 'package:ussd_app/helpers/util.dart';
import 'package:ussd_app/helpers/widgets_builder.dart';

class AmountOnlyWidget extends StatelessWidget {
  AmountOnlyWidget({
    Key? key,
    required this.ussdCode,
    required this.ussdAction,
    this.ussdShowText,
  }) : super(key: key);

  final String ussdAction;
  final String ussdCode;
  final String? ussdShowText;
  final TextEditingController _amountOnlyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    ussdShowText ?? 'Amount',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                  child: TextField(
                    controller: _amountOnlyController,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: ussdShowText ?? 'Amount'),
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: 45,
              child: SizedBox(
                child: ElevatedButton(
                    onPressed: () => {
                          if (_amountOnlyController.text.isNotEmpty)
                            {
                              CreateWidget.displayDialog(
                                  context,
                                  ussdShowText != null
                                      ? 'Action: $ussdAction\n\n$ussdShowText: ${_amountOnlyController.text}'
                                      : 'Action: $ussdAction\n\nAmount: NGN ${Util.formatAmount(_amountOnlyController.text)}',
                                  'Confirmation',
                                  CreateWidget.buildDialogButton(
                                      context: context,
                                      isInfoDialog: false,
                                      ussdCode: Util
                                          .formatUssdActionCodeForAmountOnly(
                                        ussdCode: ussdCode,
                                        amount: ussdShowText != null
                                            ? Util.formatPhoneNumber(
                                                _amountOnlyController.text)
                                            : Util.formatAmount(
                                                _amountOnlyController.text),
                                      ))),
                            }
                        },
                    child: Row(
                      children: const [
                        Spacer(),
                        Icon(
                          Icons.phone_outlined,
                          color: kHomeScreenAppBarIconColor,
                        ),
                        Text('Execute',
                            style: TextStyle(
                              color: kHomeScreenAppBarIconColor,
                              fontSize: 17,
                            )),
                        Spacer(),
                      ],
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
