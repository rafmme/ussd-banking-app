import 'package:flutter/material.dart';
import 'package:ussd_app/helpers/constants.dart';
import 'package:ussd_app/helpers/util.dart';
import 'package:ussd_app/helpers/widgets_builder.dart';
import 'package:ussd_app/models/receipient.dart';

class ReceipientAmountWidget extends StatefulWidget {
  const ReceipientAmountWidget(
      {Key? key,
      required this.ussdAction,
      required this.ussdCode,
      this.ussdShowText})
      : super(key: key);

  final String ussdAction;
  final String ussdCode;
  final String? ussdShowText;

  @override
  _ReceipientAmountWidgetState createState() => _ReceipientAmountWidgetState();
}

class _ReceipientAmountWidgetState extends State<ReceipientAmountWidget> {
  var contact = Receipient(name: '', number: '');

  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _receipientController = TextEditingController();

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
                const Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Text(
                    'Amount',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                  child: TextField(
                    controller: _amountController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Amount'),
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
            margin: const EdgeInsets.only(top: 20, bottom: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    widget.ussdShowText ?? 'Receipient',
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
                    controller: _receipientController,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: widget.ussdShowText ?? 'Receipient'),
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: SizedBox(
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * 0.47,
                    child: ElevatedButton(
                      onPressed: () async {
                        Receipient userContact = await Util.importContact();

                        setState(() {
                          contact = userContact;
                        });

                        _receipientController.text = contact.number;
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
                              if (_amountController.text.isNotEmpty &&
                                  _receipientController.text.isNotEmpty)
                                {
                                  CreateWidget.displayDialog(
                                      context,
                                      widget.ussdShowText != null
                                          ? 'Action: ${widget.ussdAction}\n\nAmount: NGN ${Util.formatAmount(_amountController.text)}\n\n${widget.ussdShowText}: ${_receipientController.text}'
                                          : 'Action: ${widget.ussdAction}\n\nAmount: NGN ${Util.formatAmount(_amountController.text)}\n\nReceipient: ${_receipientController.text}',
                                      'Confirmation',
                                      CreateWidget.buildDialogButton(
                                          context: context,
                                          isInfoDialog: false,
                                          ussdCode: Util.formatUssdActionCode(
                                              ussdCode: widget.ussdCode,
                                              amount: Util.formatAmount(
                                                  _amountController.text),
                                              receipient:
                                                  Util.formatPhoneNumber(
                                                _receipientController.text,
                                              )))),
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
        ],
      ),
    );
  }
}
