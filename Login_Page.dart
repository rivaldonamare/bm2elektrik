import 'package:bm2elektrik_app/screens/constants.dart';
import 'package:bm2elektrik_app/screens/register_page.dart';
import 'package:bm2elektrik_app/widgets/custom_btn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bm2elektrik_app/widgets/custom_input.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
  Future<String> _loginAccount() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _loginEmail, password: _loginPassword);
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
      _loginFormLoading = true;
    });

    //run the create account method
    String _loginFeedback = await _loginAccount();
    if(_loginFeedback != null) {
      _alertDialogBuilder(_loginFeedback);

      //set the form to regular state [not loading]
      setState(() {
        _loginFormLoading = false;
      });
    }
    }


  //default form loading state
  bool _loginFormLoading = false;

  // form input field values
  String _loginEmail = "";
  String _loginPassword = "";

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
                Text("Welcome to BM2 Elektrik App,\nLogin to your account",
                textAlign: TextAlign.center,
                  style: Constants.boldHeading,
                ),
                Column(
                  children: [
                    CustomInput(
                      hintText: "Email...",
                      onChanged: (value) {
                        _loginEmail = value;
                      },
                      onSubmitted: (value){
                        _passwordFocusNode.requestFocus();
                      },
                      textInputActionn: TextInputAction.next,
                    ),
                    CustomInput(
                      hintText: "Password...",
                      onChanged: (value) {
                        _loginPassword = value;
                      },
                      focusNode: _passwordFocusNode,
                      isPasswordField: true,
                      onSubmitted: (value) {
                        _submittedForm();
                      },
                    ),
                    CustomBtn(
                      text: "Login",
                      onPressed: () {
                        _submittedForm();
                        setState(() {
                          _loginFormLoading = true;
                        });
                      },
                      isLoading: _loginFormLoading,
                    )
                  ],
                ),
                CustomBtn(
                  text: "Create New Account",
                  onPressed: () {
                    Navigator.push(
                        context,
                    MaterialPageRoute(
                        builder: (context) => RegisterPage()
                    ),
                    );
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



