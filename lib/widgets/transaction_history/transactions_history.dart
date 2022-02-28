import 'package:flutter/material.dart';
import 'package:ussd_app/data/sql_helper.dart';
import 'package:ussd_app/widgets/transaction_history/transaction.dart';

class TransactionsHistoryPageWidget extends StatelessWidget {
  const TransactionsHistoryPageWidget({
    Key? key,
    required this.transactions,
    required this.isLoading,
    required this.refreshTransactionList,
  }) : super(key: key);

  final List<Map<String, dynamic>> transactions;
  final bool isLoading;
  final Function refreshTransactionList;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: transactions.isEmpty
          ? const Center(
              child: Text(
                'Your past USSD transactions history goes here.',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )
          : Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'Transactions List',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () async {
                          await SQLHelper.clearTable();
                          refreshTransactionList();
                        },
                        child: const Text(
                          'Clear All',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.74,
                  child: ListView.builder(
                    itemCount: transactions.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      final transaction = transactions[index];
                      return Transaction(transaction: transaction);
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
