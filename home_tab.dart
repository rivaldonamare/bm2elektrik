
import 'package:bm2elektrik_app/screens/constants.dart';
import 'package:bm2elektrik_app/screens/product_page.dart';
import 'package:bm2elektrik_app/widgets/product_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bm2elektrik_app/widgets/custom_action_bar.dart';


class HomeTab extends StatelessWidget {
  final CollectionReference _productsRef =
  FirebaseFirestore.instance.collection("products");

  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _productsRef.get(),
            builder: (context, snapshot) {
              if(snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error; ${snapshot.error}"),
                  ),
                );
              }

              //collecttion data ready to display
              if(snapshot.connectionState == ConnectionState.done) {
                //display the data inside  a list view
                return ListView(
                  padding: EdgeInsets.only(
                    top: 90.0,
                    bottom: 30.0,
                  ),
                  children: snapshot.data.docs.map((document) {
                    return ProductCard(
                      title: document.data()['name'],
                      imageUrl: document.data()['image'][0],
                      price: "${document.data()['price']}",
                      productId: document.id,
                    );
                  }).toList(),
                );
              }
              //Loading State
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
          CustomActionBar(
            title: "Home",
            hasBackArrow: false,
          ),
        ],
      ),
    );
  }
}



