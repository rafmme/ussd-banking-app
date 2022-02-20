import 'package:flutter/material.dart';
import 'package:ussd_app/models/bank.dart';

class BankCard extends StatelessWidget {
  const BankCard({
    Key? key,
    required this.bank,
    required this.click,
  }) : super(key: key);

  final Bank bank;
  final Function click;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => click(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: bank.color,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(blurRadius: 2, blurStyle: BlurStyle.solid)
                ],
              ),
              child: Hero(
                tag: bank.name,
                child: Image.asset(bank.image),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20 / 4),
              child: Text(
                bank.name,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Center(
              child: Text(
            '',
          ))
        ],
      ),
    );
  }
}
