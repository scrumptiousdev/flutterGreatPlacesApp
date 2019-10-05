import 'package:flutter/material.dart';

class PlacesListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {}
          )
        ]
      ),
      body: Center(
        child: CircularProgressIndicator()
      )
    );
  }
}