import '../../../core/constants/meal_types.dart';
import 'diet_item.dart';

final List<DietItem> dietItems = [
  // Breakfast
  DietItem(id: '1', title: 'Oats', meal: MealTypes.breakfast, quantity: '60 g'),

  DietItem(
    id: 'breakfast_2',
    title: 'Skimmed Milk',
    meal: MealTypes.breakfast,
    quantity: '500 ml',
  ),

  DietItem(
    id: 'breakfast_3',
    title: 'Eggs',
    meal: MealTypes.breakfast,
    quantity: '2',
  ),

  DietItem(
    id: 'breakfast_4',
    title: 'Banana',
    meal: MealTypes.breakfast,
    quantity: '1',
  ),

  DietItem(
    id: 'breakfast_5',
    title: 'NakPro Whey',
    meal: MealTypes.breakfast,
    quantity: '1 Scoop',
  ),

  DietItem(
    id: 'breakfast_6',
    title: 'Fish Oil',
    meal: MealTypes.breakfast,
    quantity: '1 Capsule',
  ),

  DietItem(
    id: 'breakfast_7',
    title: 'Vitamin D',
    meal: MealTypes.breakfast,
    quantity: '1 Tablet',
  ),

  // Lunch
  DietItem(
    id: 'lunch_1',
    title: 'Whole Wheat Bread',
    meal: MealTypes.lunch,
    quantity: '4 Slices',
  ),

  DietItem(
    id: 'lunch_2',
    title: 'Peanut Butter',
    meal: MealTypes.lunch,
    quantity: '30 g',
  ),

  DietItem(
    id: 'lunch_3',
    title: 'Honey',
    meal: MealTypes.lunch,
    quantity: '10 g',
  ),

  DietItem(id: 'lunch_4', title: 'Eggs', meal: MealTypes.lunch, quantity: '2'),

  // Dinner
  DietItem(
    id: 'dinner_1',
    title: 'Skimmed Milk',
    meal: MealTypes.dinner,
    quantity: '500 ml',
  ),

  DietItem(
    id: 'dinner_2',
    title: 'Eggs',
    meal: MealTypes.dinner,
    quantity: '2',
  ),

  DietItem(
    id: 'dinner_3',
    title: 'Guava',
    meal: MealTypes.dinner,
    quantity: '60-70 g',
  ),

  DietItem(
    id: 'dinner_4',
    title: 'Magnesium',
    meal: MealTypes.dinner,
    quantity: '1 Tablet',
  ),
];
