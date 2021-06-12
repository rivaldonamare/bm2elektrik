import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  String getUserId() {
    return _firebaseAuth.currentUser.uid;
  }
  final CollectionReference productsRef =
  FirebaseFirestore.instance.collection("products");

  final CollectionReference usersRef =
  FirebaseFirestore.instance.collection("Users");

  final CollectionReference dataPengiriman =
  FirebaseFirestore.instance.collection("Data Pengiriman");

  final CollectionReference buktiPembayaran =
  FirebaseFirestore.instance.collection("Bukti Pembayaran");

}