import 'package:bm2elektrik_app/screens/address_page.dart';
import 'package:bm2elektrik_app/screens/product_page.dart';
import 'package:bm2elektrik_app/services/firebase_services.dart';
import 'package:bm2elektrik_app/widgets/custom_action_bar.dart';
import 'package:bm2elektrik_app/widgets/custom_btn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CollectionReference _productsRef =
  FirebaseFirestore.instance.collection("Users");

  FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _firebaseServices.usersRef.doc(_firebaseServices.getUserId())
                .collection("Cart").get(),
            builder: (context, snapshot) {
              if(snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error; ${snapshot.error}"),
                  ),
                );
              }

              //Collection data ready to display
              if(snapshot.connectionState == ConnectionState.done) {
                //display the data inside  a list view
                return ListView(
                    padding: EdgeInsets.only(
                      top: 100.0,
                      bottom: 20.0,
                    ),
                    children: snapshot.data.docs.map((document) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ProductPage(productId: document.id,),
                          ));
                        },
                        child: FutureBuilder(
                          future: _firebaseServices.productsRef.doc(document.id).get(),
                          builder: (context, productSnap) {
                            if(productSnap.hasError) {
                              return Container(
                                child: Center(
                                  child: Text("${productSnap.error}"),
                                ),
                              );
                            }

                            if(productSnap.connectionState == ConnectionState.done) {
                              Map _productMap = productSnap.data.data();

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20.0,
                                  horizontal: 24.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 90,
                                      height: 90,
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(10.0),
                                        child: Image.network(
                                          "${_productMap['image'][0]}",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: 16.0,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${_productMap['name']}",
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.black,
                                                fontWeight:
                                                FontWeight.w600),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets
                                                .symmetric(
                                              vertical: 4.0,
                                            ),
                                            child: Text(
                                              "${_productMap['price']}",
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Theme.of(context)
                                                      .accentColor,
                                                  fontWeight:
                                                  FontWeight.w600),
                                            ),
                                          ),
                                          Text(
                                            "Color - ${document.data()['color']}",
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black,
                                                fontWeight:
                                                FontWeight.w600),
                                          ),
                                          Container(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                CustomBtn(
                                                  text: "  Checkout Now  ",
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => AddressPage()
                                                      ),
                                                    );
                                                  },
                                                  outlineBtn: false,
                                                ),
                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }




                            return Container(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                        ),
                      );
                    }).toList()
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
            hasBackArrow: true,
            hasTitle: true,
          ),
        ],

      ),

    );
  }
}

