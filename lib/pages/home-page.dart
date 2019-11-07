import 'package:camera/models/favorite-place.dart';
import 'package:camera/pages/create-place-page.dart';
import 'package:camera/widgets/place-tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final places = <FavoritePlace>[];

  @override
  Widget build(BuildContext context) {
    //add data to list
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 5'),
      ),
      body: places.isEmpty
          ? Center(
              child: const Text('Press + to add a new place.'),
            )
          : ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                return PlaceTile(place: places[index]);
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showCreatePlace(context);
        },
      ),
    );
  }

  void _showCreatePlace(BuildContext context) {
    // Navigator.of(context).push(
    //     context,
    //     MaterialPageRoute<dynamic>(builder: (context) => CreatePlacePage()));
    Navigator.of(context).push<dynamic>(
        MaterialPageRoute<dynamic>(builder: (context) => CreatePlacePage()));
  }
}
