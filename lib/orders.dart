import 'package:flutter/material.dart';
import 'package:lecture_one/checkout.dart';
import 'package:lecture_one/constants/theme.dart';
import 'package:lecture_one/models/order.model.dart';

class OrdersPage extends StatefulWidget {
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final List<OrdersModel> orders = [
    OrdersModel(1, 'Beef Burger', 700, 3, 'assets/images/beef.png'),
    OrdersModel(2, 'Checken Tikka Pizza', 1200, 4, 'assets/images/pizza-3.png'),
    OrdersModel(3, 'Pudding', 500, 5, 'assets/images/pudding.png'),
    OrdersModel(4, 'Cocktail', 300, 4, 'assets/images/cocktail.png'),
  ];

  navigateToCheckout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CheckoutPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        // const Text('Orders',
        //     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ListView.builder(
            itemCount: orders.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final item = orders[index];
              item.image;

              return Padding(
                padding: const EdgeInsets.all(5.0),
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
                        child: Card(
                          color: ColorConstants.white,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage(item.image),
                                      height: 100,
                                      width: 100,
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 5.0),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          item.name,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 5.0),
                                        child: Text("Rs${item.price}",
                                            style: const TextStyle(
                                                color: ColorConstants.primary,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.italic)),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 5, 5),
                                        child: const Text('Rated',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 5, 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              '${item.quantity}',
                                              style: const TextStyle(
                                                  color: ColorConstants.primary,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Icon(Icons.star,
                                                color: Colors.amber)
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
              );
            }),
      ]),
    );
  }
}
