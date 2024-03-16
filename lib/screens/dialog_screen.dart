import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogScreen extends StatefulWidget {
  const DialogScreen({super.key});

  @override
  State<DialogScreen> createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            _adaptiveDialog();
          },
          child: const Text('Show Dialog'),
        ),
      ),
      bottomSheet: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          color: Colors.orange,
          child: Text("I am from Bottom Sheet")),
    );
  }

  void _adaptiveDialog() {
    final platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS) {
      showCupertinoAlertDialog();
    } else {
      _showMyDialog();
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showCupertinoAlertDialog() {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: const Text('CupertinoAlertDialog Title'),
              content: const Text('CupertinoAlertDialog description'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ));
  }
}
