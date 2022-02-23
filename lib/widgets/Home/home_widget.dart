import 'package:flutter/material.dart';
import 'package:ussd_app/helpers/constants.dart';
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
  final _pages = [
    const HomePageWidget(),
    const TransactionsHistoryPageWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    var appBarTitle = 'USSD BANKING';

    if (_currentPage != 0) {
      appBarTitle = 'Transactions History';
    }

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
                  fontSize: 24,
                ),
              ),
              const Spacer(),
              GestureDetector(
                child: const Icon(Icons.info_outline_rounded),
                onTap: () {
                  CreateWidget.displayDialog(
                      context,
                      'For Nigerians',
                      '🇳🇬 USSD Banking App',
                      CreateWidget.buildDialogButton(
                          context: context, isInfoDialog: true));
                },
              )
            ],
          ),
        ),
        body: _pages.elementAt(_currentPage),
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
