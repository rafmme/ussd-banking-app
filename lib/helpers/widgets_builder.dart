import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'constants.dart';

class CreateWidget {
  static Future<void> createModalBottomSheet(
      BuildContext context, String? ussdAction, Size size, String image) {
    return showModalBottomSheet<void>(
      context: context,
      elevation: 100,
      isDismissible: true,
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
                      image,
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
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 10),
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
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.47,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.contact_phone_outlined,
                                        color: kHomeScreenAppBarIconColor,
                                      ),
                                      Text('Fetch Receipient',
                                          style: TextStyle(
                                            color: kHomeScreenAppBarIconColor,
                                            fontSize: 17,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: size.width * 0.33,
                                child: ElevatedButton(
                                    onPressed: () => {
                                          displayDialog(
                                              context,
                                              'message',
                                              'title',
                                              buildDialogButton(
                                                  context, false)),
                                        },
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.phone_outlined,
                                          color: kHomeScreenAppBarIconColor,
                                        ),
                                        Text('Execute',
                                            style: TextStyle(
                                              color: kHomeScreenAppBarIconColor,
                                              fontSize: 17,
                                            )),
                                      ],
                                    )),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
        );
      },
    );
  }

  static displayDialog(BuildContext context, String message, String title,
      List<Widget> dialogBtn) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              Row(
                children: dialogBtn,
              ),
            ],
          );
        });
  }

  static List<Widget> buildDialogButton(
      BuildContext context, bool isInfoDialog) {
    if (isInfoDialog == true) {
      return [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'OK',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ];
    }
    return [
      TextButton(
        child: const Text(
          'Cancel',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      const Spacer(),
      TextButton(
        onPressed: () {},
        child: Row(children: const [
          Icon(
            Icons.phone_outlined,
          ),
          Text(
            'Execute',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ]),
      )
    ];
  }
}
