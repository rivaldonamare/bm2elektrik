import 'package:bm2elektrik_app/screens/constants.dart';
import 'package:bm2elektrik_app/services/firebase_services.dart';
import 'package:bm2elektrik_app/widgets/custom_input.dart';
import 'package:bm2elektrik_app/widgets/product_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
    FirebaseServices _firebaseServices = FirebaseServices();

    String _searchString = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          if(_searchString.isEmpty)
            Center(
              child: Container(
                  child: Text(
                    "Search Result",
                    style: Constants.regularDarkText,
                  ),
              ),
            )
          else
           FutureBuilder<QuerySnapshot>(
            future: _firebaseServices.productsRef.orderBy("search_string")
                .startAt([_searchString])
                .endAt(["$_searchString\uf8ff"])
                .get(),
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
                    top: 110.0,
                    bottom: 20.0,
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
          Padding(
            padding: const EdgeInsets.only(
          top: 35.0,
          ),
            child: CustomInput(
              hintText: "Search Here...",
              onSubmitted: (value) {
                setState(() {
                  _searchString = value.toLowerCase();
                });
              },
            ),
          ),
        ],
      )
    );
  }
}
