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
                  title: Text('Material Dialog'),
                  onTap: () { showMyMaterialDialog(context); }
              ),
              ListTile(
                  title: Text('Cupertino Dialog'),
                  onTap: () { showMyCupertinoDialog(context); }
              ),
              ListTile(
                  title: Text('Dialog with result'),
                  onTap: () { showDialogWithResult(context); }
              ),
            ]
        )
    );
  }

  void showMyMaterialDialog(BuildContext context) {
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

  void showMyCupertinoDialog(BuildContext context) {
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

  void showDialogWithResult(BuildContext context) {
    showDialog(
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
    ).then((value) {
      switch (value) {
        case DialogActionType.cancel:
          print("cancel");
          break;

        case DialogActionType.ok:
          print("ok");
          break;
      }
    });
  }
}
