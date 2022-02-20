import 'package:flutter/material.dart';
import 'package:ussd_app/helpers/constants.dart';

class ConfirmationAlertDialog extends StatelessWidget {
  ConfirmationAlertDialog({Key? key, required this.message}) : super(key: key);

  final String message;
  final TextEditingController _textFieldController = TextEditingController();

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Confirmation'),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Row(
                  children: const [
                    Icon(
                      Icons.phone_outlined,
                      color: kHomeScreenAppBarIconColor,
                    ),
                    Text('Execute'),
                  ],
                ),
                onPressed: () {},
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Alert Dilaog with TestFiled'),
        ),
        body: Center(
            child: ElevatedButton(
          child: const Text(
            'Write your Number',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => _displayDialog(context),
        )));
  }
}
