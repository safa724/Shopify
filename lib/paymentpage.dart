import 'package:flutter/material.dart';
import 'package:shop/checkoutpage.dart';
import 'package:shop/firee.dart';
import 'package:shop/shipping.dart';



class Payment extends StatefulWidget {
  final List<Dress> dressList;
  final String shippingAddress;

  Payment({Key? key, required this.shippingAddress, required this.dressList}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final TextEditingController cardNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Method', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder:(context)=>Shipping(dressList: [],)));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey,
              ),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Step 2', textAlign: TextAlign.left),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Payment',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                ),
              ),
              Image(
                height: 160,
                image: AssetImage('images/creditcard.jpg'),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'OR',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                width: 450,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Name of Card',
                    contentPadding: EdgeInsets.all(13.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 50,
                width: 450,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextField(
                  controller: cardNumberController,
                  decoration: InputDecoration(
                    hintText: 'Card Number',
                    contentPadding: EdgeInsets.all(13.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
           Padding(
             padding: const EdgeInsets.only(left: 30),
             child: Center(
               child: Row(
               children: [
                 Container(
                   width: 100, // Adjust the width as needed
                   height: 70,
                   decoration: BoxDecoration(
                     border: Border.all(color: Colors.grey),
                     borderRadius: BorderRadius.circular(5.0),
                   ),
                   child: TextField(
                     decoration: InputDecoration(
                hintText: 'Exp Month',
                contentPadding: EdgeInsets.all(13.0),
                border: InputBorder.none,
                     ),
                   ),
                 ),
                 SizedBox(width: 10),
                 Container(
                   width: 100, // Adjust the width as needed
                   height: 70,
                   decoration: BoxDecoration(
                     border: Border.all(color: Colors.grey),
                     borderRadius: BorderRadius.circular(5.0),
                   ),
                   child: TextField(
                     decoration: InputDecoration(
                hintText: 'Exp Date',
                contentPadding: EdgeInsets.all(13.0),
                border: InputBorder.none,
                     ),
                   ),
                 ),
               ],
               ),
             ),
           ),
        
        
              SizedBox(height: 20),
              Container(
                height: 50,
                width: 450,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'cvv',
                    contentPadding: EdgeInsets.all(13.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
         {
        String cardNumber = cardNumberController.text;
        
        
                  Navigator.push(context,MaterialPageRoute(builder:(context)=>CheckOut(shippingAddress: widget.shippingAddress,  cardNumber: cardNumber, dressList:widget.dressList,) ));
                };
        
                },
                child: Container(
                  height: 50,
                  width: 400,
                  child: Center(
                    child: Text(
                      'Buy Now',
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
      ),
    );
  }
}
