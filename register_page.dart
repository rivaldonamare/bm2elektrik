import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bm2elektrik_app/widgets/custom_input.dart';
import 'package:bm2elektrik_app/widgets/custom_btn.dart';
import 'package:bm2elektrik_app/screens/constants.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //build an alert dialog to display some errors
  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
      return AlertDialog(
        title: Text("error"),
        content: Container(
        child: Text(error),
        ),
        actions: [
          FlatButton(
          child: Text("close dialog"),
            onPressed: () {
            Navigator.pop(context);
            },
      )
      ],
          );


          }
        );
    }

    //create a new user account
    Future<String> _createAccount() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _registerEmail, password: _registerPassword);
      return null;
    } on FirebaseAuthException catch(e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
       return 'The account already exists for that email.';
      }
      return e.message;
    } catch(e) {
      return e.toString();
    }
    }

    void _submittedForm() async {
    //set the form to loading state
    setState(() {
      _registerFormLoading = true;
    });

    //run the create account method
    String _createAccountFeedback = await _createAccount();
    if(_createAccountFeedback != null) {
      _alertDialogBuilder(_createAccountFeedback);

      //set the form to regular state [not loading]
      setState(() {
        _registerFormLoading = false;
      });
    } else {
      //go to home page
      Navigator.pop(context);
    }
    }

  //default form loading state
  bool _registerFormLoading = false;

  // form input field values
  String _registerEmail = "";
  String _registerPassword = "";

  // focus node for input fields
  FocusNode _passwordFocusNode;

  @override
  void initState() {
   _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
   _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo.png"),
              fit: BoxFit.fitHeight,
            )
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 100.0,
          ),
          child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Create your new Account",
                    textAlign: TextAlign.center,
                    style: Constants.boldHeading,
                  ),
                  Column(
                    children: [
                      CustomInput(
                        hintText: "Email...",
                        onChanged: (value) {
                          _registerEmail = value;
                        },
                        onSubmitted: (value){
                          _passwordFocusNode.requestFocus();
                        },
                        textInputActionn: TextInputAction.next,
                      ),
                      CustomInput(
                        hintText: "Password...",
                        onChanged: (value) {
                          _registerPassword = value;
                        },
                        focusNode: _passwordFocusNode,
                        isPasswordField: true,
                        onSubmitted: (value) {
                          _submittedForm();
                        },
                      ),
                      CustomBtn(
                        text: "Create New Account",
                        onPressed: () {
                          _submittedForm();
                          setState(() {
                          _registerFormLoading = true;
                          });
                        },
                        isLoading: _registerFormLoading,
                      )
                    ],
                  ),
                  CustomBtn(
                    text: "Back To Login",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    outlineBtn: true,
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}
