import 'package:flutter/material.dart';
import 'package:ussd_app/models/Bank.dart';

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
                  height: 550,
                  width: size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      )),
                  child: const Text('USSD Action here'),
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
