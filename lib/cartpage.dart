import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Bar.dart';
import 'package:shop/account.dart';
import 'package:shop/cartprovider.dart';
import 'package:shop/category1.dart';
import 'package:shop/homepage.dart';
import 'package:shop/shipping.dart';

import 'firee.dart';



class CartPage extends StatefulWidget {
  
   final List<Dress> dressList;
  const CartPage({super.key, required this.dressList, });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
     final cart = Provider.of<Cart<Dress>>(context, listen: false);
    double total = 0.0; // Initialize a variable to store the total price

    // Calculate the total price of dresses in the cart
    for (Dress dress in widget.dressList) {
      cart.addItem(dress);
      total += dress.rate; // Assuming 'rate' is the price of a dress
    }

    
   
    return Scaffold(
      bottomNavigationBar: CommonBottomNavigationBar(
        currentIndex: 2, // Set the current index for the Home screen
        onTap: (int index) {
          // Handle navigation here
          if (index == 0) {
            // Navigate to Categories screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>HomePage()),
            );
          } else if (index == 1) {
            // Navigate to Cart screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Category1()),
            );
            
          }
          else if (index == 3) {
            // Navigate to Cart screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccountPage()),
            );
            
          }
        }
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.orange,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_checkout_outlined,
              color: Colors.orange,
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Expanded(
            child:ListView.builder(
              itemCount: cart.items.length,
          
            itemBuilder: (context, index) {
              final dressItem = cart.items[index];
            
              return _buildSingleCartProduct(dressItem);
            },
          ),
        ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Total: \$${total.toStringAsFixed(2)}', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
          ),
          Container(
            width: 250,
            height: 60, // Set the desired height of the button
            child: OutlinedButton(
              
              
              onPressed: () {
         Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => Shipping(dressList: widget.dressList)),
);
              },
            style: ElevatedButton.styleFrom(
      backgroundColor: Colors.orange, // Set the background color to orange
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
      ),
    ),
              child: Text('Buy Now',style: TextStyle(color: Colors.black),),
            ),
          ),
        ],
      ),
      
      );
    
  }

  Widget _buildSingleCartProduct(Dress dressList) {
    return Container(
      height: 130,
      width: 190,
      child: Card(
        color: Colors.orange[50],
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 130,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(dressList.url), // You might need to change this image path
                ),
              ),
            ),
            Container(
              height: 140,
              width: 200,
              child: ListTile1(dressList: dressList),
            ),
          ],
        ),
      ),
    );
  }
}

    
       
 class ListTile1 extends StatefulWidget {
  final Dress dressList;

  ListTile1({required this.dressList});

  @override
  State<ListTile1> createState() => _ListTile1State();
}

class _ListTile1State extends State<ListTile1> {
  @override
  Widget build(BuildContext context) {
     final cart = Provider.of<Cart<Dress>>(context, listen: false); 
     

    return ListTile(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.dressList.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            'Free Size',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            '\$${widget.dressList.rate.toString()}',
            style: TextStyle(fontSize: 16, color: Colors.orange),
          ),
          Container(
            height: 35,
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    if (widget.dressList.quantity > 1) {
      setState(() {
        widget.dressList.quantity--;
      });
    }
    cart.removeItem(widget.dressList);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Icon(Icons.remove, color: Colors.white),
                  ),
                ),
               Text(
  widget.dressList.quantity.toString(), // Display the updated quantity
  style: TextStyle(fontSize: 15),
),
                GestureDetector(
                  onTap: () {
                   setState(() {
     widget.dressList.quantity++;
    });
    cart.addItem(widget.dressList);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
