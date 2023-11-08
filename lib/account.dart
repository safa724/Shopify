import 'package:flutter/material.dart';
import 'package:shop/Bar.dart';
import 'package:shop/cartpage.dart';
import 'package:shop/category1.dart';
import 'package:shop/homepage.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 240, 200, 142),
        title: Text("My Account"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("images/usericon.jpg"),
            ),
            SizedBox(height: 16),
            Text(
              "John Doe",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "johndoe@email.com",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Edit Profile"),
              onTap: () {
                // Navigate to profile edit page.
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text("My Orders"),
              onTap: () {
                // Navigate to orders history page.
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text("My Favorites"),
              onTap: () {
                // Navigate to favorite products page.
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sign Out"),
              onTap: () {
              
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CommonBottomNavigationBar(
        currentIndex: 3, // Set the current index for the Home screen
        onTap: (int index) {
          // Handle navigation here
          if (index == 0) {
            // Navigate to Categories screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>HomePage()),
            );
          } else if (index == 2) {
            // Navigate to Cart screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage(dressList: [],)),
            );
            
          }
          else if (index == 1) {
            // Navigate to Cart screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Category1()),
            );
            
          }
        }
      )
      );
    
  }
}

