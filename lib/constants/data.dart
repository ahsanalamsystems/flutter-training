import 'package:lecture_one/models/items.model.dart';

class DataClass {
  // ignore: non_constant_identifier_names
  static final List<ItemsModel> MenuItems = [
    ItemsModel(1, 'Zinger', 500.0, 20.0, 5, 'assets/images/zinger.png'),
    ItemsModel(1, 'Beef Burger', 700.0, 20.0, 3, 'assets/images/beef.png'),
    ItemsModel(
        1, 'Steak Zinger', 1000.0, 20.0, 4, 'assets/images/steak-zinger.png'),
    ItemsModel(1, 'Vegii Pizza', 1000.0, 50.0, 4, 'assets/images/pizza-1.png'),
    ItemsModel(
        1, 'Afghani Pizza', 5100.0, 50.0, 3, 'assets/images/pizza-2.png'),
    ItemsModel(
        1, 'Checken Tikka Pizza', 1200.0, 50.0, 4, 'assets/images/pizza-3.png'),
    ItemsModel(1, 'Cup cake', 200.0, 20.0, 5, 'assets/images/cupcake.png'),
    ItemsModel(1, 'Pudding', 500.0, 20.0, 5, 'assets/images/pudding.png'),
    ItemsModel(1, 'Icecream', 150.0, 20.0, 5, 'assets/images/icecream.png'),
    ItemsModel(1, 'Softdrink', 100.0, 20.0, 5, 'assets/images/softdrink.png'),
    ItemsModel(1, 'Cocktail', 300.0, 20.0, 5, 'assets/images/cocktail.png'),
    ItemsModel(1, 'Lemonade', 200.0, 20.0, 5, 'assets/images/lemonade.png'),
  ];

  List<ItemsModel> getMenuItems() {
    return MenuItems;
  }
}
