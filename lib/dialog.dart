import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

enum AlertDialogResult {
  cancel,
  ok,
}

enum SimpleDialogResult {
  first,
  second,
  third,
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
              ListTile(
                  title: Text('Simple Dialog'),
                  onTap: () { _showSimpleDialog(context); }
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
    var result = await showDialog<AlertDialogResult>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Title"),
          content: const Text("Content"),
          actions: <Widget>[
            new FlatButton(
                child: const Text('CANCEL'),
                onPressed: () { Navigator.pop(context, AlertDialogResult.cancel); }
            ),
            new FlatButton(
                child: const Text('OK'),
                onPressed: () { Navigator.pop(context, AlertDialogResult.ok); }
            )
          ],
        )
    );

    switch (result) {
      case AlertDialogResult.cancel:
        print("cancel");
        break;

      case AlertDialogResult.ok:
        print("ok");
        break;
    }
  }

  Future _showSimpleDialog(BuildContext context) async {
    var result = await showDialog<SimpleDialogResult>(
        context: context,
        builder: (BuildContext context) => SimpleDialog(
          title: const Text("Title"),
          children: <Widget>[
            SimpleDialogOption(
              child: const Text('First'),
              onPressed: () { Navigator.pop(context, SimpleDialogResult.first); },
            ),
            SimpleDialogOption(
              child: const Text('Second'),
              onPressed: () { Navigator.pop(context, SimpleDialogResult.second); },
            ),
            SimpleDialogOption(
              child: const Text('Third'),
              onPressed: () { Navigator.pop(context, SimpleDialogResult.third); },
            ),
          ],
        )
    );

    switch (result) {
      case SimpleDialogResult.first:
        print("first");
        break;

      case SimpleDialogResult.second:
        print("second");
        break;

      case SimpleDialogResult.third:
        print("third");
        break;
    }
  }
}
