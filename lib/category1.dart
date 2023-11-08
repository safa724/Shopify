import 'package:flutter/material.dart';
import 'package:shop/Bar.dart';
import 'package:shop/account.dart';
import 'package:shop/cartpage.dart';
import 'package:shop/homepage.dart';
import 'package:shop/menus/accsmenu.dart';
import 'package:shop/menus/cropmenu.dart';
import 'package:shop/menus/dressmenu.dart';
import 'package:shop/menus/jacketmenu.dart';
import 'package:shop/menus/shoemenu.dart';
import 'package:shop/menus/suitmenu.dart';
import 'package:shop/menus/tshirtmenu.dart';
import 'package:shop/menus/watchesmenu.dart';
import 'package:shop/minimalproducts.dart';

List<Map<String, dynamic>> category7 = [
 {
    'image': 'images/Cwatch.jpg',
    'text': 'Watches',
  },
 
 
  
  {
    'image': 'images/Ccrop.webp',
    'text': 'Crop Tops',
  },
  {
    'image': 'images/Caccs.jpg',
    'text': 'Accessories',
  },
  {
    'image': 'images/Cdress.jpg',
    'text': 'Dresses',
  },
  {
    'image': 'images/Cjacket.jpg',
    'text': 'Jackets',
  },
  {
    'image': 'images/Csuit.jpg',
    'text': 'Suits',
  },
  {
    'image': 'images/Ctshirt.png',
    'text': 'Tshirts',
  },
  {
    'image': 'images/Cshoe.webp',
    'text': 'Shoes',
  },
  
];

class Category1 extends StatefulWidget {
   
  @override
  State<Category1> createState() => _Category1State();
}

class _Category1State extends State<Category1> {
   void navigateToCategoryPage(String categoryName) {
    switch (categoryName) {
      case 'Shoes':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Shoe()));
        break;
      case 'Crop Tops':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Crop()));
        break;
      case 'Accessories':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Accs()));
        break;
      case 'Dresses':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Dresss()));
        break;
      case 'Jackets':
        Navigator.push(context, MaterialPageRoute(builder: (context) =>Jackets()));
        break;
      case 'Suits':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Suits()));
        break;
      case 'Tshirts':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Tshirts()));
        break;
         case 'Watches':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Watches()));
        break;
      default:
        // Handle the case when an unknown category is selected
        break;
    }
  }
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Categories'),
      ),
       bottomNavigationBar: CommonBottomNavigationBar(
        currentIndex: 1, // Set the current index for the Home screen
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
              MaterialPageRoute(builder: (context) => CartPage(dressList:[])),
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
      body:
         Column(
          children: [
            SizedBox(height: 10),
            Scrollbar(
              thumbVisibility: true,
              controller: _scrollController,
              child: SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(category7.length, (index) {
                    // Access the category's image and text from category7
                    final category = category7[index];
                    final image = category['image'] as String; // Access the image
                    final text = category['text'] as String; // Access the category text
          
                    return Container(
                    
                      margin: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                           navigateToCategoryPage(text);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child:Card(
                             
                              child: Container(
                                width: 150,
                                height: 190,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(image), // Display the image
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ),
                          Text(text), // Display the category text
                          SizedBox(height: 20),
                          
                        ],
                      ),
                      
                    );
                  }
                  ),
          
                ),
              ),
            ),
         
            SizedBox(height: 10,),
            Column(
              children: [
                Text('Minimal Products', textAlign:TextAlign.left,style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22,),),
                SizedBox(height: 10,),
               
                    
                  
                
                  Center(
                    child: Container(
                      height: 300,
                      width: 300,
                      child: MinimalProducts()),
                  ),
              ]
                      )
                  ],
                ),
      );
            
  
    
  }
}
