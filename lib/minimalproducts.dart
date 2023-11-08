import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop/firee.dart';
import 'package:shop/menus/accsmenu.dart';

class MinimalProducts extends StatelessWidget {
  const MinimalProducts({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('minimal').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
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
      )
  );
}
}