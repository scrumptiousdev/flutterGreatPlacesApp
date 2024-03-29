import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/great_places.dart';
import './pages/places_list_page.dart';
import './pages/add_place_page.dart';
import './pages/place_detail_page.dart';

void main() => runApp(GreatPlacesApp());

class GreatPlacesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber
        ),
        home: PlacesListPage(),
        routes: {
          AddPlacePage.routeName: (ctx) => AddPlacePage(),
          PlaceDetailPage.routeName: (ctx) => PlaceDetailPage()
        }
      )
    );
  }
}