import 'package:flutter/material.dart';
import 'package:ussd_app/data/sql_helper.dart';
import 'package:ussd_app/helpers/constants.dart';
import 'package:ussd_app/helpers/util.dart';
import 'package:ussd_app/helpers/widgets_builder.dart';
import 'package:ussd_app/widgets/Home/home_page_widget.dart';
import 'package:ussd_app/widgets/transaction_history/transactions_history.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  var _currentPage = 0;
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
    Util.requestPhoneCallAccessPermission();
    var appBarTitle = 'USSD BANKING';

    if (_currentPage == 1) {
      appBarTitle = 'Transactions History';
      _refreshTransactions();
    }

    final pages = [
      const HomePageWidget(),
      TransactionsHistoryPageWidget(
        transactions: _transactions,
        isLoading: _isLoading,
        refreshTransactionList: _refreshTransactions,
      ),
    ];

    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          iconTheme: const IconThemeData(color: kHomeScreenAppBarIconColor),
          title: Row(
            children: [
              const Text('🇳🇬'),
              const Spacer(),
              Text(
                appBarTitle,
                style: const TextStyle(
                  color: kHomeScreenAppBarIconColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.info_outline_rounded),
                onPressed: () {
                  CreateWidget.displayDialog(
                      context,
                      "USSD Banking made easy for Nigerians.\n\nThis app helps you perform banking transactions via your bank's USSD platform without the need to memorize the various USSD codes.\n\n📞 Bank on the dial! 😃",
                      '🇳🇬 USSD Banking App',
                      CreateWidget.buildDialogButton(
                          context: context, isInfoDialog: true));
                },
              )
            ],
          ),
        ),
        body: pages.elementAt(_currentPage),
        bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history_outlined),
                  label: "Transactions History"),
            ],
            elevation: 10,
            currentIndex: _currentPage,
            fixedColor: kHoomeScreenAppBarColor,
            onTap: (int inIndex) {
              setState(() {
                _currentPage = inIndex;
              });
            }));
  }
}
