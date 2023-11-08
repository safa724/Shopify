import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop/Bar.dart';
import 'package:shop/account.dart';
import 'package:shop/cartpage.dart';
import 'package:shop/category1.dart';
import 'package:shop/detailspage.dart';
import 'package:shop/firee.dart';



class HomePage extends StatefulWidget {
  HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
  User? user = FirebaseAuth.instance.currentUser;
  String userEmail = user?.email ?? 'N/A';
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        
        drawer:  Drawer(
          
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(accountName: Text('Welcome',style: TextStyle(fontSize: 18,color: Colors.brown,fontWeight: FontWeight.bold),), accountEmail: Text(userEmail,style: TextStyle(fontSize: 15,color: Color.fromARGB(255, 216, 131, 4)),
              ),
              arrowColor: Colors.black,
              currentAccountPicture: CircleAvatar(
                
                backgroundImage: AssetImage('images/usericon.jpg'),
              ),
              decoration: BoxDecoration(color: Colors.orangeAccent),
              ),
              
              
               ListTile(
                onTap: (){
  
                },
                leading: Icon(Icons.home),
                title: Text("Home"),
              ),
               ListTile(
                onTap: (){
  
                },
                leading: Icon(Icons.shopping_cart),
                title: Text("Cart"),
              ),
               ListTile(
                onTap: (){
  
                },
                leading: Icon(Icons.info),
                title: Text("About"),
              ),
               ListTile(
                onTap: (){
  
                },
                leading: Icon(Icons.logout),
                title: Text("Logout"),
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Shopify', style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold)),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.orangeAccent,
          actions: <Widget>[
            IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          ],
        ),
        body:  Container(
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              Container(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                    color: Colors.orangeAccent,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: "What are you looking for???",
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 90,
                color: Color.fromARGB(255, 219, 216, 210),
                width: double.infinity,
                child: const Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(child: Image(image: AssetImage('images/shoe.webp'))),
                          Text(
                            'The New \n Shoe Collection \n Is Available \n Now',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const TabBar(
                tabs: [
                  Tab(text: 'New'),
                  Tab(text: 'Popular'),
                  Tab(text: 'Trends'),
                  Tab(text: 'Kids'),
                  Tab(text: 'Women'),
                ],
                indicatorColor:Colors.orange ,
                labelColor: Colors.orange, // Set the color of all tabs' label text to orange
  unselectedLabelColor: Colors.black,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildProductGrid('dress'), // For the 'dress' tab
_buildProductGrid('popoular'),// For the 'popular' tab
_buildProductGrid('trendy'), // For the 'trendy' tab
_buildProductGrid('kids'),
_buildProductGrid('women')
                
                  ],
                ),
              ),
            ],
          ),
      
        ),
        bottomNavigationBar: CommonBottomNavigationBar(
        currentIndex: 0, // Set the current index for the Home screen
        onTap: (int index) {
          // Handle navigation here
          if (index == 1) {
            // Navigate to Categories screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>Category1()),
            );
          } else if (index == 2) {
           
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage(dressList: [],)));
        
            
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
      )
      );
      }
}

Widget _buildProductGrid(String collectionName) {
  final CollectionReference collection = FirebaseFirestore.instance.collection(collectionName);
  return StreamBuilder<QuerySnapshot>(
    stream: collection.snapshots(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator();
      }
      if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      }
      final dressList = snapshot.data?.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Dress(
          name: data['name'],
          url: data['url'],
          description: data['description'],
          rate: double.parse(data['rate'].toString()),
        );
      }).toList();

      return GridView.count(
        crossAxisCount: 2, // Set the number of cards in each row to 2
        childAspectRatio: 0.7, // Adjust the aspect ratio as needed
        children: dressList?.map((product) {
          return ShoeCard(dressList: product);
        }).toList() ?? [],
      );
    },
  );
}







  class ShoeCard extends StatelessWidget {
  final Dress dressList;

  ShoeCard({required this.dressList});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Details(dressList: dressList),
          ),
        );
      },
      child: Card(
        elevation: 3,
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Image.network(
                  dressList.url,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      dressList.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$${dressList.rate.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
