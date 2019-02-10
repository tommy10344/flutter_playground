import 'package:flutter/material.dart';

class TransitionFirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First Route'),
        ),
        body: Center(
            child: RaisedButton(
                child: Text('Open route'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TransitionSecondScreen())
                  );
                }
            )
        )
    );
  }
}

class TransitionSecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Route'),
        ),
        body: Center(
            child: RaisedButton(
                child: Text('Go back!'),
                onPressed: () {
                  Navigator.pop(context);
                }
            )
        )
    );
  }
}
