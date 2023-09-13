import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_places/models/place.dart';

class PlaceProvider extends StateNotifier<List<Place>> {
  PlaceProvider() : super([]);

  void addPlace(String title) {
    state = [
      ...state,
      Place(title: title),
    ];
  }
}

final placeProvider = StateNotifierProvider<PlaceProvider, List<Place>>(
  (ref) => PlaceProvider(),
);