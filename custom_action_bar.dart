import 'package:bm2elektrik_app/screens/cart_page.dart';
import 'package:bm2elektrik_app/screens/constants.dart';
import 'package:bm2elektrik_app/services/firebase_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomActionBar extends StatelessWidget {
  final String title;
  final bool hasBackArrow;
  final bool hasTitle;
  final bool hasBackground;
  CustomActionBar({this.title, this.hasBackArrow, this.hasTitle, this.hasBackground});

  FirebaseServices _firebaseServices = FirebaseServices();

  final CollectionReference _usersRef = FirebaseFirestore.instance.collection("users");


  @override
  Widget build(BuildContext context) {
    bool _hasBackArrow = hasBackArrow ?? false;
    bool _hasTitle = hasTitle ?? true;
    bool _hasBackground = hasBackground ?? true;

    return Container(
      decoration: BoxDecoration(
        gradient: _hasBackground ? LinearGradient(
          colors: [
            Colors.white,
            Colors.white.withOpacity(0),
          ],
          begin: Alignment(0, 0),
          end:  Alignment(0, 1),
        ): null
      ),
      padding: EdgeInsets.only(
        top: 45.0,
        left: 24.0,
        right: 24.0,
        bottom: 45.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(_hasBackArrow)
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: Alignment.center,
              child: Image(
                image: AssetImage(
                  "assets/images/back_arrow.png"
                ),
                color: Colors.white,
                width: 16.0,
                height: 16.0,
              ),
              ),
            ),
          if(_hasTitle)
          Text(title ?? "Cart",
          style: Constants.boldHeading,
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => CartPage(),
              ));
            },
            child: Container(
              width: 42.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(8.0),
              ),
              alignment: Alignment.center,
              child: Image(
                image: AssetImage(
                  "assets/images/cart.png"
                ),
                color: Colors.white,
                width: 30.0,
                height: 30.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
