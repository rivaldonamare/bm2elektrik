

import 'package:bm2elektrik_app/screens/constants.dart';
import 'package:bm2elektrik_app/services/firebase_services.dart';
import 'package:bm2elektrik_app/widgets/custom_action_bar.dart';
import 'package:bm2elektrik_app/widgets/product_color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  final String productId;
  ProductPage({this.productId});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  FirebaseServices _firebaseServices = FirebaseServices();


  String _selectedProductColor = "0";

  Future _addToCart() {
    return _firebaseServices.usersRef
        .doc(_firebaseServices.getUserId())
        .collection("Cart")
        .doc(widget.productId)
        .set({"color": _selectedProductColor});
  }

  Future _addToSaved() {
    return _firebaseServices.usersRef
        .doc(_firebaseServices.getUserId())
        .collection("Saved")
        .doc(widget.productId)
        .set({"color": _selectedProductColor});
  }

  final SnackBar _snackBar = SnackBar(content: Text("Product Added"),);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: _firebaseServices.productsRef.doc(widget.productId).get(),
            builder: (context, snapshot) {
              if(snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error; ${snapshot.error}"),
                  ),
                );
              }

              if(snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> documentData = snapshot.data.data();

                //list of color
                List productColors = documentData['color'];

                //set an initial color
                _selectedProductColor = productColors[0];

                return ListView(
                  padding: EdgeInsets.only(
                    top: 70.0,
                  ),
                  children: [
                    Image.network(
                        "${documentData['image'][0]}"
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                        horizontal: 30.0,
                    ),
                      child: Text(
                         "${documentData['name']}",
                      style:Constants.boldHeading,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 30.0,
                      ),
                      child: Text(
                      "${documentData['price']}",
                      style: TextStyle(
                      fontSize: 18.0,
                      color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w600,
                      ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 30.0,
                      ),
                      child: Text(
                      "${documentData['desc']}",
                        style: TextStyle(
                        fontSize: 16.0,
                      ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 30.0,
                      ),
                      child: Text(
                        "color",
                        style:Constants.boldHeading,
                        ),
                      ),
                    ProductColor(
                      productColors: productColors,
                      onSelected: (color) {
                        _selectedProductColor = color;
                      }
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () async{
                              await _addToSaved();
                              Scaffold.of(context).showSnackBar(_snackBar);
                            },
                            child: Container(
                              width: 65.0,
                              height: 65.0,
                              decoration: BoxDecoration(
                              color: Color(0xFFDCDCDC),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              alignment: Alignment.center,
                              child: Image(
                                image: AssetImage(
                                  "assets/images/tab_saved.png",
                                ),
                                height: 20.0,
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async{
                                await _addToCart();
                                Scaffold.of(context).showSnackBar(_snackBar);
                              },
                              child: Container(
                                height: 65.0,
                                margin: EdgeInsets.only(
                                  left: 16.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                alignment: Alignment.center,
                                child: Text("Add to Cart",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }


              //Loading State
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );

            }
          ),
          CustomActionBar(
            hasTitle: false,
            hasBackArrow:true,
            hasBackground: true,
          )
        ],
      ),
    );
  }
}
