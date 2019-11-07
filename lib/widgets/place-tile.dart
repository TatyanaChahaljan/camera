import 'package:camera/models/favorite-place.dart';
import 'package:flutter/material.dart';

class PlaceTile extends StatelessWidget {
  const PlaceTile({Key key, this.place}) : super(key: key);

  final FavoritePlace place;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _viewItem(context),
      leading: Image.file(place.photo),
      title: Text(
        place.name,
        style: Theme.of(context).textTheme.subhead,
        maxLines: 1,
      ),
      subtitle: Text(
        place.description,
        style: Theme.of(context).textTheme.subtitle,
        maxLines: 1,
      ),
    );
  }

  void _viewItem(BuildContext context) {
    Navigator.of(context)
        .push<dynamic>(MaterialPageRoute<dynamic>(builder: (context) {
      return Scaffold(
        appBar: AppBar(title: Text(place.name)),
        body: Center(
          child: Image.file(place.photo),
        ),
      );
    }));
  }
}
