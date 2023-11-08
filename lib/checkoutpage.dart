import 'package:flutter/material.dart';
import 'package:shop/firee.dart';
import 'package:shop/paymentpage.dart';
import 'package:shop/success.dart';

class CheckOut extends StatefulWidget {
  final String shippingAddress;
  final String cardNumber;
  final List<Dress> dressList;
  const CheckOut({Key? key, required this.shippingAddress, required this.cardNumber, required this.dressList});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int selectedOption = -1;
  double shippingRate = 20.0;
  List<String> deliveryImages = [
    'images/dhl.png',
    'images/dtdc.png',
    'images/ekart.jpg',
    'images/fedex.png',
  ];

  @override
  Widget build(BuildContext context) {
    double orderTotal = 0.0;
    for (Dress dress in widget.dressList) {
      orderTotal += dress.rate; // Assuming 'rate' is the price of a dress
    }

    // Calculate the overall total (order total + shipping rate)
    double overallTotal = orderTotal + shippingRate;
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckOut', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(shippingAddress: '', dressList: const [])));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Shipping address',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: 470,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 252, 240, 225),
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(widget.shippingAddress),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Payment',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 252, 240, 225),
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  children: <Widget>[
                    Image.asset('images/mastercard.png'),
                    Text(widget.cardNumber),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Delivery Method',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(deliveryImages.length, (index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedOption = index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selectedOption == index ? Colors.orange : Colors.transparent,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      height: 70,
                      width: 60,
                      child: Image.asset(deliveryImages[index]),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    elevation: 3,
                    margin: EdgeInsets.all(0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Order Total: \$${orderTotal.toStringAsFixed(2)}',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Shipping Rate: \$${shippingRate.toStringAsFixed(2)}',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Divider(),
                          Text(
                            'Overall Total: \$${overallTotal.toStringAsFixed(2)}',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.orange),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessPage()));
                    },
                    child: Container(
                      height: 50,
                      width: 400,
                      child: Center(
                        child: Text(
                          'Place Order',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
