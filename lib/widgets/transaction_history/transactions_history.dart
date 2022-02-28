import 'package:flutter/material.dart';
import 'package:ussd_app/data/sql_helper.dart';

class TransactionsHistoryPageWidget extends StatefulWidget {
  const TransactionsHistoryPageWidget({Key? key}) : super(key: key);

  @override
  _TransactionsHistoryPageWidgetState createState() =>
      _TransactionsHistoryPageWidgetState();
}

class _TransactionsHistoryPageWidgetState
    extends State<TransactionsHistoryPageWidget> {
  List<Map<String, dynamic>> _transactions = [];
  bool _isLoading = true;

  void _refreshTransactions() async {
    final data = await SQLHelper.getUSSDTransactions();
    setState(() {
      _transactions = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _transactions.isEmpty
          ? const Center(
              child: Text(
                'Your past USSD transactions history goes here.',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )
          : Center(
              child: Text(
                '${_transactions.length}',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
    );
  }
}
