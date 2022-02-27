import 'package:flutter/material.dart';
import 'package:ussd_app/helpers/constants.dart';
import 'package:ussd_app/helpers/util.dart';
import 'package:ussd_app/helpers/widgets_builder.dart';
import 'package:ussd_app/models/receipient.dart';

class ElectricityBillPaymentWidget extends StatefulWidget {
  const ElectricityBillPaymentWidget({
    Key? key,
    required this.ussdAction,
    required this.ussdCode,
    required this.electricityBill,
    required this.discoCodes,
  }) : super(key: key);

  final String ussdAction;
  final String ussdCode;
  final String electricityBill;
  final Map<String, String> discoCodes;

  @override
  _ElectricityBillPaymentWidgetState createState() =>
      _ElectricityBillPaymentWidgetState();
}

class _ElectricityBillPaymentWidgetState
    extends State<ElectricityBillPaymentWidget> {
  var contact = Receipient(name: '', number: '');
  String dropdownvalue = 'Choose your Area Electricity Disco.';

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
          widget.electricityBill == 'wema'
              ? Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 4),
                        child: Text(
                          "Meter Number / Account Number",
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
                          controller: _receipientController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Meter Number / Account Number'),
                          keyboardType: TextInputType.phone,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Text(
                    "Select Disco.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                  child: DropdownButton(
                    value: dropdownvalue,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: widget.discoCodes.keys.toList().map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                        onTap: () {
                          setState(() {
                            dropdownvalue = item;
                          });
                        },
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      (() {
                        dropdownvalue = newValue!;
                        setState(() {
                          dropdownvalue = newValue;
                        });
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          widget.electricityBill == 'wema'
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
                                        _receipientController.text.isNotEmpty &&
                                        dropdownvalue !=
                                            'Choose your Area Electricity Disco.')
                                      {
                                        CreateWidget.displayDialog(
                                            context,
                                            'Action: ${widget.ussdAction}\n\nAmount: NGN ${Util.formatAmount(_amountController.text)}\n\nMeter Number/Account Number: ${_receipientController.text}\n\nElectricity Disco: $dropdownvalue\n\nDisco. Code: ${widget.discoCodes[dropdownvalue]}',
                                            'Confirmation',
                                            CreateWidget.buildDialogButton(
                                                context: context,
                                                isInfoDialog: false,
                                                ussdCode: Util
                                                    .formatUssdActionCodeForElectricityBillPayment(
                                                  ussdCode: widget.ussdCode,
                                                  amount: Util.formatAmount(
                                                    _amountController.text,
                                                  ),
                                                  discoCode:
                                                      '${widget.discoCodes[dropdownvalue]}',
                                                  meterNumber:
                                                      _receipientController
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
                                if (_amountController.text.isNotEmpty &&
                                    dropdownvalue !=
                                        'Choose your Area Electricity Disco.')
                                  {
                                    CreateWidget.displayDialog(
                                        context,
                                        'Action: ${widget.ussdAction}\n\nAmount: NGN ${Util.formatAmount(_amountController.text)}\n\nElectricity Disco: $dropdownvalue\n\nDisco. Code: ${widget.discoCodes[dropdownvalue]}',
                                        'Confirmation',
                                        CreateWidget.buildDialogButton(
                                            context: context,
                                            isInfoDialog: false,
                                            ussdCode: Util
                                                .formatUssdActionCodeForElectricityBillPayment(
                                              ussdCode: widget.ussdCode,
                                              amount: Util.formatAmount(
                                                  _amountController.text),
                                              discoCode:
                                                  '${widget.discoCodes[dropdownvalue]}',
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
