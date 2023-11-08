


import 'package:flutter/material.dart';
import 'package:shop/cartpage.dart';
import 'package:shop/firee.dart';

class Details extends StatefulWidget {
  final Dress dressList;
   Details({Key? key,  required this.dressList}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool isExpanded = false;

  int selectedCircleIndex = -1;

  final List<Color> pastelColors = [
    Colors.pink[200]!,
    Colors.blue[200]!,
    Colors.green[200]!,
    Colors.orange[200]!,
    Colors.purple[200]!,
  ];

  List<String> sizes = ["S", "M", "L"];

  String selectedSize = "";
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            height:  (MediaQuery.of(context).size.height ) , 
            width:  (MediaQuery.of(context).size.width ) , 
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.dressList.url),
                fit: BoxFit.cover,
              ),
            ),
            child: ClipRRect(
              child: Container(
                color: Colors.black.withOpacity(0.4),
              ),
            ),
          ),
          Positioned(
            left: 10,
            child: IconButton(
              iconSize: 35,
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
          Positioned(
            right: 20,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_bag_rounded),
              color: Colors.black,
              iconSize: 35,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          Positioned(
            left: 80,
            bottom: 20,
            child: isExpanded ? _buildExpandedView() : _buildDefaultView(),
          ),
        ],
      ),
    );
  }

Widget _buildDefaultView() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.8),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        bottomLeft: Radius.circular(10),
      ),
    ),
    height: 290,
    width: 310,
    child: Stack(
      children: [
        Positioned(
          left: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.dressList.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(width: 173),
                  IconButton(
                    color: Colors.orange,
                    icon: Icon(Icons.fullscreen_rounded),
                    onPressed: () {
                      setState(() {
                        isExpanded = true;
                      });
                    },
                  ),
                ],
              ),
              Text('\$${widget.dressList.rate.toStringAsFixed(2)}',style: TextStyle(fontSize: 16, color: Colors.orangeAccent),),
              Text(widget.dressList.description, style: TextStyle(fontSize: 14, color: Colors.white), maxLines: 3),
              SizedBox(height: 45),
                Row(
                  children: List.generate(pastelColors.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCircleIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: pastelColors[index],
                          border: Border.all(
                            color: selectedCircleIndex == index ? Colors.black : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 10,),
                Row(
                  children: sizes.map((size) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSize = size;
                        });
                      },
                      child: Container(
                        width: 60,
                        height: 35,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: selectedSize == size ? Colors.white : Colors.transparent,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(
                          child: Text(
                            size,
                            style: TextStyle(
                              color: selectedSize == size ? Colors.black : Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: () {
                     Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage(dressList:[widget.dressList]))); 
                  },
                  child: Container(
                    height: 50,
                    width: 300,
                    child: Center(
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandedView() {
    return Positioned.fill(
      child: Container(
        height:  (MediaQuery.of(context).size.height ) , 
            width:  (MediaQuery.of(context).size.width ) , 
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
        ),
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
             
                setState(() {
                  isExpanded = false;
                });
              },
              child: Icon(
                Icons.close,
                color: Color.fromRGBO(151, 145, 145, 1),
                size: 27,
              ),
            ),
            Positioned(
              left: 15,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(height: 40,),
                      Row(
                        children: [
                          Text(widget.dressList.name, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
                          SizedBox(width: 180),
                        ],
                      ),
                      Text( '\$${widget.dressList.rate.toStringAsFixed(2)}',  style: TextStyle(fontSize: 20, color: Colors.orangeAccent),),
                      Container(
                        width: (MediaQuery.of(context).size.width ) , 
                        child: Text(
                          widget.dressList.description,
                          softWrap: true, style: TextStyle(fontSize: 14, color: Color.fromARGB(234, 167, 164, 164)),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(color: Color.fromARGB(255, 65, 63, 63), height: 2, width: 1400,),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          SizedBox(height: 10,),
                          Text('Select Color', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),),
                          SizedBox(width: 70),
                          Row(
                            children: List.generate(pastelColors.length, (index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedCircleIndex = index;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  width: 30,
                                  height: 30,
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: pastelColors[index],
                                    border: Border.all(
                                      color: selectedCircleIndex == index ? Colors.black : Colors.transparent,
                                      width: 3,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      SizedBox(height: 10,),
                      Container(color: Color.fromARGB(255, 65, 63, 63), height: 2, width: 1400,),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Text('Select Size', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),),
                          SizedBox(width: 80),
                          Row(
                            children: sizes.map((size) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSize = size;
                                  });
                                },
                                child: Container(
                                  width: 60,
                                  height: 35,
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                    color: selectedSize == size ? Colors.white : Colors.transparent,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      size,
                                      style: TextStyle(
                                        color: selectedSize == size ? Colors.black : Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Container(color: Color.fromARGB(255, 65, 63, 63), height: 2, width: 1400,),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Text('Shipping', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),),
                          SizedBox(width: 250),
                          Text('Free', style: TextStyle(color: Colors.grey, fontSize: 16),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Container(color: Color.fromARGB(255, 65, 63, 63), height: 2, width: 1400,),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Text('Rating', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),),
                          SizedBox(width: 170),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                color: Colors.orangeAccent,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.orangeAccent,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.orangeAccent,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.orangeAccent,
                              ),
                              Icon(
                                Icons.star_border,
                                color: Colors.orangeAccent,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 110,),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                               Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage(dressList: [],)));  
                            },
                            child: Container(
                              height: 50,
                              width: 340,
                              child: Center(
                                child: Text(
                                  'Add to Cart',
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.orangeAccent,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ]
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
