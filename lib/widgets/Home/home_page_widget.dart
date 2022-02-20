import 'package:flutter/material.dart';
import 'package:ussd_app/data/banks_list.dart';
import 'package:ussd_app/screens/bank/bank_screen.dart';
import 'package:ussd_app/widgets/bank_card/bank_card_widget.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GridView.builder(
                itemCount: banksList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => GridTile(
                      child: BankCard(
                          bank: banksList[index],
                          click: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankScreen(bank: banksList[index])))),
                    )),
          ))
        ],
      ),
    );
  }
}
