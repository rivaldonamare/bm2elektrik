import 'package:bm2elektrik_app/screens/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bm2elektrik_app/screens/Home_Page.dart';
import 'package:bm2elektrik_app/screens/Login_Page.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("Error: ${snapshot.error}"),
              ),
            );
          }

          //connection intiallized - firebase app is running
          if(snapshot.connectionState == ConnectionState.done) {

            //streambuilder can check the login state live
            return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, streamSnapshot) {
                if (streamSnapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("Error: ${streamSnapshot.error}"),
                    ),
                  );
                }

                if(streamSnapshot.connectionState == ConnectionState.active) {
                  User _user = streamSnapshot.data;
                  if(_user == null) {
                    return LoginPage();
                  } else{
                    return HomePage();
                  }
                }

                return Scaffold(
                  body: Center(
                    child: Text(""
                        "Checking Authentication....",
                      style: Constants.regularHeading,
                    ),
                  ),
                );
              },
            );
          }

          return Scaffold(
            body: Center(
                child: Text(
                  "Initialization App....",
                  style: Constants.regularHeading,
                )
            ),
          );
        }
    );
  }
}


