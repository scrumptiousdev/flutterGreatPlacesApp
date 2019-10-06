import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/add_place_page.dart';
import '../providers/great_places.dart';

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
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).getPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting ? Center(
          child: CircularProgressIndicator()
        ) : Consumer<GreatPlaces>(
          builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <= 0 ? ch : ListView.builder(
            itemCount: greatPlaces.items.length,
            itemBuilder: (ctx, i) => ListTile(
              leading: CircleAvatar(
                backgroundImage: FileImage(greatPlaces.items[i].image)
              ),
              title: Text(greatPlaces.items[i].title),
              subtitle: Text(greatPlaces.items[i].location.address),
              onTap: () {
                
              }
            )
          ),
          child: Center(
            child: const Text('No places yet, start adding!')
          )
        )
      )
    );
  }
}