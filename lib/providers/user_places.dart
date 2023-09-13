import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_places/models/place.dart';

class UserPlaces extends StateNotifier<List<Place>> {
  UserPlaces() : super(const []);

  void addPlace(String title) {
    state = [
      Place(title: title),
      ...state,
    ];
  }
}

final placeProvider = StateNotifierProvider<UserPlaces, List<Place>>(
  (ref) => UserPlaces(),
);
