import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/models/favorite-place.dart';

class CreatePlacePage extends StatefulWidget {
  @override
  _CreatePlacePageState createState() => _CreatePlacePageState();
}

class _CreatePlacePageState extends State<CreatePlacePage> {
  File _photo;
  String _placeName;
  String _placeDescription;

  Future _getPhoto() async {
    final image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _photo = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create your favourite place'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                if (_photo != null) Image.file(_photo),
                RaisedButton(
                  child: const Text('Take picture'),
                  onPressed: () {
                    _getPhoto();
                  },
                ),
                TextField(
                  onChanged: (text) {
                    _placeName = text;
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      labelText: 'Enter picture name'),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  onChanged: (text) {
                    _placeDescription = text;
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      labelText: 'Enter description'),
                ),
                RaisedButton(
                  child: const Text('Create'),
                  onPressed: () {
                    _save(context);
                  },
                ),
              ],
            ),
          ),
        ));
  }

  void _save(BuildContext context) {
    print(_placeDescription);
    if (_photo == null || _placeDescription.isEmpty || _placeName.isEmpty) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: const Text(
              'Photo, place name and place description must be specified.'),
          backgroundColor: Theme.of(context).accentColor,
          duration: Duration(seconds: 3),
        ),
      );
    } else {
      final place = FavoritePlace(_placeName, _placeDescription, _photo);
      Navigator.pop(context, place);
    }
  }
}
