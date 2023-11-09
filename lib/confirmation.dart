import 'package:flutter/material.dart';
import 'package:lecture_one/cart.dart';
import 'package:lecture_one/constants/theme.dart';
import 'package:lecture_one/models/items.model.dart';

class ConfirmationPage extends StatefulWidget {
  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: ColorConstants.primary,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: const SizedBox(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Order Placed',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: ColorConstants.white),
                        ),
                        Image(
                          image: AssetImage('assets/images/tick.png'),
                          height: 50,
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
        Container(
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
                                  fontSize: 15, fontWeight: FontWeight.w500)),
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
                                  fontSize: 15, fontWeight: FontWeight.w500)),
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
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                          Text('Rs1950',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: ColorConstants.primary)),
                        ]),
                  )
                ]),
              )),
        ),
      ]),
    ));
  }
}
