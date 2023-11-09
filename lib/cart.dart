import 'package:flutter/material.dart';
import 'package:lecture_one/checkout.dart';
import 'package:lecture_one/constants/theme.dart';
import 'package:lecture_one/models/order.model.dart';

class CartPage extends StatefulWidget {
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<OrdersModel> orders = [
    OrdersModel(1, 'Zinger', 500, 2, 'assets/images/zinger.png'),
    OrdersModel(2, 'Vegii Pizza', 1000, 1, 'assets/images/pizza-1.png'),
    OrdersModel(3, 'Icecream', 150, 2, 'assets/images/icecream.png'),
    OrdersModel(4, 'Lemonade', 200, 3, 'assets/images/lemonade.png'),
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
        title: const Text('My Cart',
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
                                        child: const Text('Quantity',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 5, 5),
                                        child: Text(
                                          '${item.quantity}',
                                          style: const TextStyle(
                                              color: ColorConstants.primary,
                                              fontSize: 20,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.bold),
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

        Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: navigateToCheckout,
              style: const ButtonStyle(
                  elevation: MaterialStatePropertyAll(0.0),
                  backgroundColor:
                      MaterialStatePropertyAll(ColorConstants.primary)),
              child: const Text(
                'Checkout',
                style: TextStyle(color: ColorConstants.white),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
