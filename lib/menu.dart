import 'package:flutter/material.dart';
import 'package:lecture_one/cart.dart';
import 'package:lecture_one/constants/theme.dart';
import 'package:lecture_one/item-detail.dart';
import 'package:lecture_one/models/items.model.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final FocusNode myFocusNode = FocusNode();
  bool isFocused = false;

  final List<ItemsModel> MenuItems = [
    ItemsModel(1, 'Zinger', 500, 20, 5, 'assets/images/zinger.png'),
    ItemsModel(2, 'Beef Burger', 700, 20, 3, 'assets/images/beef.png'),
    ItemsModel(
        3, 'Steak Zinger', 1000, 20, 4, 'assets/images/steak-zinger.png'),
    ItemsModel(4, 'Vegii Pizza', 1000, 50, 4, 'assets/images/pizza-1.png'),
    ItemsModel(5, 'Afghani Pizza', 5100, 50, 3, 'assets/images/pizza-2.png'),
    ItemsModel(
        6, 'Checken Tikka Pizza', 1200, 50, 4, 'assets/images/pizza-3.png'),
    ItemsModel(7, 'Cup cake', 200, 20, 5, 'assets/images/cupcake.png'),
    ItemsModel(8, 'Pudding', 500, 20, 5, 'assets/images/pudding.png'),
    ItemsModel(9, 'Icecream', 150, 20, 5, 'assets/images/icecream.png'),
    ItemsModel(10, 'Softdrink', 100, 20, 5, 'assets/images/softdrink.png'),
    ItemsModel(11, 'Cocktail', 300, 20, 5, 'assets/images/cocktail.png'),
    ItemsModel(12, 'Lemonade', 200, 20, 5, 'assets/images/lemonade.png'),
  ];

  void navigateToItemDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ItemDetails()),
    );
  }

  void navigateToMyCart() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CartPage()),
    );
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: ListView(shrinkWrap: true, children: [
        Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      const Image(
                        image: AssetImage('assets/images/avatar.png'),
                        height: 50,
                        width: 50,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text('Ahsan',
                            style: TextStyle(
                              fontSize: 30,
                            )),
                      )
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: navigateToMyCart,
                        child: const Image(
                          image: AssetImage('assets/images/cart.png'),
                          height: 25,
                          width: 25,
                        ),
                      ),
                      const Image(
                        image: AssetImage('assets/images/bell.png'),
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(50.0), // Adjust the border radius
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                  labelText: isFocused ? null : 'Search',
                  filled: true,
                  fillColor: ColorConstants.grey,
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: ColorConstants.grey)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: ColorConstants.grey))),
              style: const TextStyle(color: ColorConstants.white, fontSize: 15),
              onTap: () {
                setState(() {
                  isFocused = true;
                });
              },
              onFieldSubmitted: (value) {
                setState(() {
                  isFocused = false;
                });
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Row(
              children: [
                SizedBox(
                  height: 60,
                  width: 90,
                  child: Column(
                    children: [
                      Image(
                          image: AssetImage('assets/images/burger.png'),
                          height: 40,
                          width: 40),
                      Text('Burger', style: TextStyle(fontSize: 12))
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: 90,
                  child: Column(
                    children: [
                      Image(
                          image: AssetImage('assets/images/pizza.png'),
                          height: 40,
                          width: 40),
                      Text('Pizza', style: TextStyle(fontSize: 12))
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: 90,
                  child: Column(
                    children: [
                      Image(
                          image: AssetImage('assets/images/dessert.png'),
                          height: 40,
                          width: 40),
                      Text('Dessert', style: TextStyle(fontSize: 12))
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: 90,
                  child: Column(
                    children: [
                      Image(
                          image: AssetImage('assets/images/drink.png'),
                          height: 40,
                          width: 40),
                      Text('Drink', style: TextStyle(fontSize: 12))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const Text('Popular',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 250,
                      // width: 190,
                      child: Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: ColorConstants.cardShadow, // Shadow color
                              spreadRadius: 0, // Adjust the spread effect
                              blurRadius: 20, // Adjust the blur effect
                              offset: Offset(0, 0), // Offset for the shadow
                            ),
                          ],
                        ),
                        child: const Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0))),
                          elevation: 0.0,
                          color: ColorConstants.white,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage('assets/images/zinger.png'),
                                  height: 120,
                                  width: 130,
                                ),
                                Text(
                                  'Zinger',
                                  style: TextStyle(
                                    // color: ColorConstants.primary,
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    children: [
                                      Text('5.0 |',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Icon(Icons.star, color: Colors.amber),
                                      Icon(Icons.star, color: Colors.amber),
                                      Icon(Icons.star, color: Colors.amber),
                                      Icon(Icons.star, color: Colors.amber),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Rs500",
                                          style: TextStyle(
                                              color: ColorConstants.primary,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic)),
                                      Padding(
                                        padding: EdgeInsets.zero,
                                        child: Text(
                                          '|',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.delivery_dining,
                                        color: ColorConstants.primary,
                                        size: 18,
                                      ),
                                      Text(
                                        'Rs 20',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Image(
                                        image: AssetImage(
                                            'assets/images/heart.png'),
                                        height: 25,
                                        width: 25,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 250,
                      // width: 190,
                      child: Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: ColorConstants.cardShadow, // Shadow color
                              spreadRadius: 0, // Adjust the spread effect
                              blurRadius: 20, // Adjust the blur effect
                              offset: Offset(0, 0), // Offset for the shadow
                            ),
                          ],
                        ),
                        child: const Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0))),
                          elevation: 0.0,
                          color: ColorConstants.white,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image(
                                  image:
                                      AssetImage('assets/images/pizza-1.png'),
                                  height: 120,
                                  width: 130,
                                ),
                                Text(
                                  'Vegii Pizza',
                                  style: TextStyle(
                                    // color: ColorConstants.primary,
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    children: [
                                      Text('4.0 |',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Icon(Icons.star, color: Colors.amber),
                                      Icon(Icons.star, color: Colors.amber),
                                      Icon(Icons.star, color: Colors.amber),
                                      Icon(Icons.star, color: Colors.amber),
                                      // Icon(Icons.star, color: Colors.amber),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Rs1000",
                                          style: TextStyle(
                                              color: ColorConstants.primary,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic)),
                                      Padding(
                                        padding: EdgeInsets.zero,
                                        child: Text(
                                          '|',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.delivery_dining,
                                        color: ColorConstants.primary,
                                        size: 18,
                                      ),
                                      Text(
                                        'Rs 20',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Image(
                                          image: AssetImage(
                                              'assets/images/heart.png'),
                                          height: 25,
                                          width: 25,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Column(children: [
              const Text('Menu',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ListView.builder(
                  itemCount: MenuItems.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = MenuItems[index];
                    item.image;

                    return Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                      child: Row(children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: 120,
                            child: Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorConstants.cardShadow,
                                    spreadRadius: 1,
                                    blurRadius: 20,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: GestureDetector(
                                onTap: navigateToItemDetails,
                                child: Card(
                                  color: ColorConstants.white,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                  elevation: 0.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image(
                                              image: AssetImage(item.image),
                                              height: 100,
                                              width: 100,
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(left: 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      bottom: 5.0),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    item.name,
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      bottom: 5.0),
                                                  child: Row(
                                                    children: [
                                                      Text('${item.rating} ',
                                                          style: const TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      const Icon(
                                                        Icons.star,
                                                        color: Colors.amber,
                                                        size: 20.0,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      bottom: 5.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                  "Rs${item.price}",
                                                                  style: const TextStyle(
                                                                      color: ColorConstants
                                                                          .primary,
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic)),
                                                              const Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            5.0),
                                                                child: Text(
                                                                  '|',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                ),
                                                              ),
                                                              const Icon(
                                                                Icons
                                                                    .delivery_dining,
                                                                color:
                                                                    ColorConstants
                                                                        .primary,
                                                                size: 18,
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        5.0),
                                                                child: Text(
                                                                  '${item.deliveryCharges}',
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      const Column(
                                                        children: [
                                                          Image(
                                                            image: AssetImage(
                                                                'assets/images/heart.png'),
                                                            height: 25,
                                                            width: 25,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ]),
                    );
                  })
            ]),
          )
        ]),
      ]),
    );
  }
}
