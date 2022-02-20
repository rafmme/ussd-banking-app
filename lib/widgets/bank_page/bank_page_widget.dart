import 'package:flutter/material.dart';
import 'package:ussd_app/helpers/constants.dart';
import 'package:ussd_app/models/bank.dart';
import 'package:ussd_app/widgets/ussd_action/bank_ussd_action.dart';

class BankScreenWidget extends StatelessWidget {
  const BankScreenWidget({Key? key, required this.bank}) : super(key: key);

  final Bank bank;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                  width: size.width,
                  decoration: const BoxDecoration(
                      color: kBankUSSDBackground,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      )),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('${bank.name} USSD List',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                          const Spacer(),
                          Text(
                            bank.ussdCode,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: bank.color,
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: SizedBox(
                          height: 420,
                          child: GridView.builder(
                              itemCount: bank.listOfavailableBankUssdOps.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 0,
                                crossAxisSpacing: 0,
                                childAspectRatio: 1,
                              ),
                              itemBuilder: (context, index) {
                                Map<String, String> ussdActionData =
                                    bank.listOfavailableBankUssdOps[index];

                                return BankUssdActionWidget(
                                    bank: bank, ussdActionData: ussdActionData);
                              }),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(100, 25, 100, 25),
                  child: Hero(
                    tag: bank.name,
                    child: Image.asset(
                      bank.image,
                      width: 200,
                      height: 120,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
