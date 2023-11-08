import 'package:flutter/material.dart';
import 'package:shop/firee.dart';
import 'package:shop/paymentpage.dart';



class Shipping extends StatefulWidget {
   final List<Dress> dressList;
   Shipping({super.key, required this.dressList});

  @override
  State<Shipping> createState() => _ShippingState();
}

class _ShippingState extends State<Shipping> {
final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckOut', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 1, // Adjust the height as needed
                color: Colors.grey,
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Step 1', textAlign: TextAlign.left),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Shipping', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextField(
                      
                    decoration: InputDecoration(
                    
                      hintText: 'Your Name',
                      contentPadding: EdgeInsets.all(10.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextField(
                    controller: addressController,
                    decoration: InputDecoration(
                      hintText: 'Delivery Address',
                   
                      contentPadding: EdgeInsets.all(10.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'City Name',
                            contentPadding: EdgeInsets.all(10.0),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Pin Code',
                            contentPadding: EdgeInsets.all(10.0),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Your Country Name',
                      contentPadding: EdgeInsets.all(10.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              InkWell(
              onTap: () {
          String shippingAddress = addressController.text;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Payment(
          shippingAddress: shippingAddress,
          dressList: widget.dressList,
              ),
            ),
          );
        },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 40,
                    width: 400,
                    child: Center(child: Text('Next - Pay', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 218, 134, 9),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
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
