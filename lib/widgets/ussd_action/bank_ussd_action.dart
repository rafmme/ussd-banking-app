import 'package:flutter/material.dart';
import 'package:ussd_app/helpers/constants.dart';
import 'package:ussd_app/helpers/util.dart';
import 'package:ussd_app/models/bank.dart';

class BankUssdActionWidget extends StatelessWidget {
  const BankUssdActionWidget({
    Key? key,
    required this.bank,
    required this.ussdActionData,
  }) : super(key: key);

  final Bank bank;
  final Map<String, String> ussdActionData;

  @override
  Widget build(BuildContext context) {
    final String? ussdAction = ussdActionData['action'];
    final String? ussdCode = ussdActionData['code'];
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        if (ussdActionData['dialUp'] != null) {
          showModalBottomSheet<void>(
            context: context,
            elevation: 100,
            isDismissible: false,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight: Radius.circular(50))),
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.only(
                    top: 15,
                    left: 15,
                    right: 15,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 80),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            bank.image,
                            width: 30,
                            height: 20,
                          ),
                          Text(
                            '$ussdAction',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 25),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Padding(
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
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Amount'),
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 20, bottom: 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 4),
                                    child: Text(
                                      'Receipient',
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
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Receipient'),
                                      keyboardType: TextInputType.phone,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: SizedBox(
                                      width: size.width,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: const Text(
                                            'Load Receipient from Contact list',
                                            style: TextStyle(
                                              fontSize: 18,
                                            )),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: size.width * 0.4,
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: const Text('Execute',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                )),
                                          ),
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          width: size.width * 0.4,
                                          child: ElevatedButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text('Cancel',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                  ))),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ]),
              );
            },
          );
          return;
        }

        Util.dialUssdCode(ussdCode!);
      },
      child: GridTile(
          child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 3, right: 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.call,
                color: bank.color,
              ),
              Text(
                ussdAction!,
                style: const TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
