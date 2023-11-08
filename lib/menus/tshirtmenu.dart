import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop/detailspage.dart';
import 'package:shop/firee.dart';

class Tshirts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Tshirts'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _buildList('tshirts'),
    );
  }
}

Widget _buildList(String collectionName) {
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

      return SingleChildScrollView(
        child: Wrap(
          spacing: 8, // Adjust as needed
          runSpacing: 8, // Adjust as needed
          children: dressList?.map((product) {
            return SizedBox(
              width: (MediaQuery.of(context).size.width / 2) - 8, // Two cards in one row with spacing
              height: 320, // Set a fixed height for all cards
              child: ShoeCard(dressList: product),
            );
          }).toList() ?? [],
        ),
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
