import 'package:flutter/material.dart';
import 'package:ussd_app/helpers/constants.dart';
import 'package:ussd_app/helpers/util.dart';
import 'package:ussd_app/helpers/widgets_builder.dart';
import 'package:ussd_app/models/receipient.dart';

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
    final Size size = MediaQuery.of(context).size;

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
          ussdShowText != null
              ? Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.47,
                          child: ElevatedButton(
                            onPressed: () async {
                              Receipient userContact =
                                  await Util.importContact();
                              _amountOnlyController.text = userContact.number;
                            },
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.contact_phone_outlined,
                                  color: kHomeScreenAppBarIconColor,
                                ),
                                Text('Open Phonebook',
                                    style: TextStyle(
                                      color: kHomeScreenAppBarIconColor,
                                      fontSize: 17,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: size.width * 0.33,
                          child: ElevatedButton(
                              onPressed: () => {
                                    if (_amountOnlyController.text.isNotEmpty)
                                      {
                                        CreateWidget.displayDialog(
                                            context,
                                            'Action: $ussdAction\n\n$ussdShowText: ${_amountOnlyController.text}',
                                            'Confirmation',
                                            CreateWidget.buildDialogButton(
                                                context: context,
                                                isInfoDialog: false,
                                                ussdCode: Util
                                                    .formatUssdActionCodeForAmountOnly(
                                                  ussdCode: ussdCode,
                                                  amount: ussdShowText ==
                                                          'Phone Number'
                                                      ? Util.formatPhoneNumber(
                                                          _amountOnlyController
                                                              .text)
                                                      : _amountOnlyController
                                                          .text,
                                                ))),
                                      }
                                  },
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.phone_outlined,
                                    color: kHomeScreenAppBarIconColor,
                                  ),
                                  Text('Execute',
                                      style: TextStyle(
                                        color: kHomeScreenAppBarIconColor,
                                        fontSize: 17,
                                      )),
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                )
              : Container(
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
                                        'Action: $ussdAction\n\nAmount: NGN ${Util.formatAmount(_amountOnlyController.text)}',
                                        'Confirmation',
                                        CreateWidget.buildDialogButton(
                                            context: context,
                                            isInfoDialog: false,
                                            ussdCode: Util
                                                .formatUssdActionCodeForAmountOnly(
                                              ussdCode: ussdCode,
                                              amount: Util.formatAmount(
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
                ),
        ],
      ),
    );
  }
}
