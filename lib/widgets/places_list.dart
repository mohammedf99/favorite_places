import 'package:flutter/material.dart';

import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/place_details_screen.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  void _openPlaceDetails(BuildContext context, Place place) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PlaceDetailsScreen(
          place: place,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          "No places yet, start adding some!",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (ctx, index) {
        return ListTile(
          title: Text(
            places[index].title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          onTap: () => _openPlaceDetails(context, places[index]),
        );
      },
    );
  }
}
