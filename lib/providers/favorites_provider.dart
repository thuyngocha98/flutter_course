import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_course/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleFavorite(Meal meal) {
    final isExisting = state.contains(meal);

    if (isExisting) {
      state = [...state]..remove(meal);
      return false;
    } else {
      state = [...state]..add(meal);
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
