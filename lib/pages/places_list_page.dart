import 'package:flutter/material.dart';

import '../pages/add_place_page.dart';

class PlacesListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.of(context).pushNamed(AddPlacePage.routeName)
          )
        ]
      ),
      body: Center(
        child: CircularProgressIndicator()
      )
    );
  }
}