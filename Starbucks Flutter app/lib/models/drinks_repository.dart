import 'dart:collection';

import 'drink.dart';

class DrinksRepository {
  UnmodifiableListView<Drink> get allDrinks {
    return UnmodifiableListView(_allDrinks);
  }

  int get allDrinksCount {
    return _allDrinks.length;
  }

  final List<Drink> _allDrinks = [
    Drink(
      name: 'Iced Cappuccino',
      description:
          'With less milk than a latte, Iced Cappuccino offers a stronger espresso flavor, a luxurious texture and a velvety, frothy foam with a crisp, cool undercurrent.',
      image: 'cappuccino.png',
      price: 7.4,
    ),
    Drink(
      name: 'Iced Caffè Latte',
      description:
          'Our dark, rich espresso is combined with milk and served over ice. A perfect milk-forward cool down.',
      image: 'caffe_latte.png',
      price: 7.4,
    ),
    Drink(
      name: 'Iced Vanilla Latte',
      description:
          'Rich, full-bodied espresso blended with milk and vanilla syrup, served over ice.',
      image: 'vanilla_latte.png',
      price: 8.1,
    ),
    Drink(
      name: 'Iced Mocha',
      description:
          'We combine our rich, full-bodied espresso with bittersweet mocha sauce, milk and ice. The classic coffee drink to satisfy your sweet tooth.',
      image: 'mocha.png',
      price: 8.1,
    ),
    Drink(
      name: 'Iced White Chocolate Mocha',
      description:
          'Extra-smooth espresso meets white chocolate sauce, milk, ice and finished off with whipped cream.',
      image: 'white_choco_mocha.png',
      price: 8.1,
    ),
    Drink(
      name: 'Iced Caramel Macchiato',
      description:
          'Cold milk with vanilla-flavored syrup is marked with espresso and topped with caramel drizzle for an oh-so-sweet finish.',
      image: 'caramel_macch.png',
      price: 8.2,
    ),
    Drink(
      name: 'Iced Americano',
      description:
          'Espresso shots are topped with water, then served over ice. The result is this wonderfully rich cup with depth and nuance.',
      image: 'americano.png',
      price: 6,
    ),
  ];
}
