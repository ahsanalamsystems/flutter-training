import 'package:flutter/material.dart';
import 'package:lecture_one/confirmation.dart';
import 'package:lecture_one/constants/theme.dart';
import 'package:lecture_one/models/items.model.dart';
import 'package:lecture_one/models/order.model.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final List<OrdersModel> orders = [
    OrdersModel(1, 'Zinger', 500, 1, 'assets/images/zinger.png'),
    OrdersModel(2, 'Vegii Pizza', 1000, 1, 'assets/images/pizza-1.png'),
    OrdersModel(3, 'Icecream', 150, 1, 'assets/images/icecream.png'),
    OrdersModel(4, 'Lemonade', 200, 1, 'assets/images/lemonade.png'),
  ];

  void navigateToConfirmation() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ConfirmationPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        elevation: 0,
        shadowColor: Colors.white,
        backgroundColor: ColorConstants.white,
      ),
      backgroundColor: ColorConstants.white,
      body: Container(
        color: ColorConstants.white,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.only(bottom: 10),
              child: Expanded(
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
                    child: const Card(
                      color: ColorConstants.white,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      elevation: 0.0,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Deliver To',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Icon(Icons.location_on,
                                      color: ColorConstants.primary, size: 40),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Home',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Abc Square, London',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.only(bottom: 10),
              child: Expanded(
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
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  elevation: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Order Summary',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Divider(),
                          ListView.builder(
                              itemCount: orders.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final item = orders[index];
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 5.0),
                                  child: Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image(
                                            image: AssetImage(item.image),
                                            height: 80,
                                            width: 80,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 5.0),
                                              alignment: Alignment.centerLeft,
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
                                              child: Text("Rs${item.price}",
                                                  style: const TextStyle(
                                                      color: ColorConstants
                                                          .primary,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FontStyle.italic)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 5, 5),
                                              child: const Text('Quantity',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 5, 5),
                                              child: Text(
                                                '${item.quantity}',
                                                style: const TextStyle(
                                                    color:
                                                        ColorConstants.primary,
                                                    fontSize: 20,
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ]),
                  ),
                ),
              )),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.only(bottom: 10),
              child: Expanded(
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
                child: const Card(
                  color: ColorConstants.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  elevation: 0.0,
                  child: SizedBox(
                    height: 50,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Payment Method',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Cash',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: ColorConstants.primary),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: ColorConstants.primary,
                                size: 18,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.only(bottom: 10),
              child: Expanded(
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
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Subtotal:',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                                Text('Rs1850',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: ColorConstants.primary)),
                              ]),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Delivery Fee:',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                                Text('Rs100',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: ColorConstants.primary)),
                              ]),
                        ),
                        const Divider(),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total:',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                                Text('Rs1950',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: ColorConstants.primary)),
                              ]),
                        )
                      ]),
                    )),
              )),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                onPressed: navigateToConfirmation,
                style: const ButtonStyle(
                    elevation: MaterialStatePropertyAll(0.0),
                    backgroundColor:
                        MaterialStatePropertyAll(ColorConstants.primary)),
                child: const Text(
                  'Place Order',
                  style: TextStyle(color: ColorConstants.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
