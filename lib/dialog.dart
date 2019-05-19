import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

enum DialogActionType {
  cancel,
  ok,
}

class DialogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dialog'),
        ),
        body: ListView(
            children: <Widget>[
              ListTile(
                  title: Text('Alert Dialog'),
                  onTap: () { _showAlertDialog(context); }
              ),
              ListTile(
                  title: Text('Cupertino Alert Dialog'),
                  onTap: () { _showCupertinoAlertDialog(context); }
              ),
              ListTile(
                  title: Text('Alert Dialog with result'),
                  onTap: () { _showAlertDialogWithResult(context); }
              ),
            ]
        )
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Title"),
          content: const Text("Content"),
          actions: <Widget>[
            FlatButton(
                child: const Text('CANCEL'),
                onPressed: () { Navigator.pop(context); }
            ),
            FlatButton(
                child: const Text('OK'),
                onPressed: () { Navigator.pop(context); }
            )
          ],
        )
    );
  }

  void _showCupertinoAlertDialog(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text("Title"),
          content: const Text("Content"),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text('Normal'),
              onPressed: () { Navigator.pop(context); },
            ),
            CupertinoDialogAction(
              child: const Text('Default'),
              onPressed: () { Navigator.pop(context); },
              isDefaultAction: true,
            ),
            CupertinoDialogAction(
              child: const Text('Destructive'),
              onPressed: () { Navigator.pop(context); },
              isDestructiveAction: true,
            ),
          ],
        )
    );
  }

  Future _showAlertDialogWithResult(BuildContext context) async {
    var result = await showDialog<DialogActionType>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Title"),
          content: const Text("Content"),
          actions: <Widget>[
            new FlatButton(
                child: const Text('CANCEL'),
                onPressed: () { Navigator.pop(context, DialogActionType.cancel); }
            ),
            new FlatButton(
                child: const Text('OK'),
                onPressed: () { Navigator.pop(context, DialogActionType.ok); }
            )
          ],
        )
    );

    switch (result) {
      case DialogActionType.cancel:
        print("cancel");
        break;

      case DialogActionType.ok:
        print("ok");
        break;
    }
  }
}
