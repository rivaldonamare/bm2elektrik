import 'package:bm2elektrik_app/screens/verification_page.dart';
import 'package:bm2elektrik_app/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  final formKey  = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Payment Method'),),
        body: Padding(
        padding: const EdgeInsets.all(12.0),
          child: Form(
            key: formKey,
              child: ListView(
                    padding: EdgeInsets.only(
                    top: 10.0,
                    bottom: 12.0,
                    ),
                  children: [
                        Padding(
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
                              child: Image(image: AssetImage("assets/images/bca.jpg"),
                              ),
                            ),
                          ),
                              Container(
                                padding: EdgeInsets.only(
                                  top: 5.0,
                                  left: 16.0,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Transfer via Bank BCA",
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
                                        "25478981561651 - BM2 Elekktrik",
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Theme.of(context)
                                                .accentColor,
                                            fontWeight:
                                            FontWeight.w600),
                                      ),
                                    ),
                                    Text(
                                      "Manual Verification",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                          fontWeight:
                                          FontWeight.w600),
                                    ),
                          ],
                          ),
                        ),
                      ],
                    ),
                        ),
                    Padding(padding: const EdgeInsets.symmetric(
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
                              child: Image(image: AssetImage("assets/images/mandiri.jpg"),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: 5.0,
                              left: 16.0,
                            ),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Transfer via Bank Mandiri",
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
                                    "25478981567777 - BM2 Elekktrik",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Theme.of(context)
                                            .accentColor,
                                        fontWeight:
                                        FontWeight.w600),
                                  ),
                                ),
                                Text(
                                  "Manual Verification",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight:
                                      FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: const EdgeInsets.symmetric(
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
                              child: Image(image: AssetImage("assets/images/dki.jpg"),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: 5.0,
                              left: 16.0,
                            ),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Transfer via Bank DKI",
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
                                    "25478981567744 - BM2 Elekktrik",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Theme.of(context)
                                            .accentColor,
                                        fontWeight:
                                        FontWeight.w600),
                                  ),
                                ),
                                Text(
                                  "Manual Verification",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight:
                                      FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: const EdgeInsets.symmetric(
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
                              child: Image(image: AssetImage("assets/images/bni.png"),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: 5.0,
                              left: 16.0,
                            ),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Transfer via Bank BNI",
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
                                    "25478981565554 - BM2 Elekktrik",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Theme.of(context)
                                            .accentColor,
                                        fontWeight:
                                        FontWeight.w600),
                                  ),
                                ),
                                Text(
                                  "Manual Verification",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight:
                                      FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: const EdgeInsets.symmetric(
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
                              child: Image(image: AssetImage("assets/images/bri.jpg"),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: 5.0,
                              left: 16.0,
                            ),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Transfer via Bank BRI",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                      fontWeight:
                                      FontWeight.w600),
                                ),
                                Padding(
                                  padding: const EdgeInsets
                                      .symmetric(
                                    vertical: 5.0,
                                  ),
                                  child: Text(
                                    "25478981565554 - BM2 Elekktrik",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Theme.of(context)
                                            .accentColor,
                                        fontWeight:
                                        FontWeight.w600),
                                  ),
                                ),
                                Text(
                                  "Manual Verification",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight:
                                      FontWeight.w600),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomBtn(
                            text: "  Verification  Now  ",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VerificationPage()
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

            ),
        );


  }
}
