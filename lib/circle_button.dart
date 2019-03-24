import 'package:flutter/material.dart';

class CircleButtonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circle Button'),
      ),
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          child: FlatButton(
            onPressed: () {},
            child: Center(
                child: Text(
                  "1",
                  style: TextStyle(color: Colors.white, fontSize: 32),
                )
            ),
            shape: new CircleBorder(),
            color: Colors.red,
            padding: const EdgeInsets.all(16.0),
          ),
        ),
      ),
    );
  }
}
