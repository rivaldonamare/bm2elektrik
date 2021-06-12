import 'package:bm2elektrik_app/screens/payment_method.dart';
import 'package:bm2elektrik_app/services/firebase_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatefulWidget {


  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final CollectionReference dataPengiriman =
  FirebaseFirestore.instance.collection("Users");

  FirebaseServices _firebaseServices = FirebaseServices();

  final formKey = GlobalKey<FormState>();
  TextEditingController namaLengkap = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController noTelp = new TextEditingController();
  TextEditingController alamat = new TextEditingController();
  TextEditingController kota = new TextEditingController();
  TextEditingController kodePos = new TextEditingController();
  TextEditingController jumlahBarang = new TextEditingController();
  TextEditingController catatan = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Masukan Data Pengiriman'),),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.only(
              top: 8.0,
              bottom: 12.0,
            ),
            children: [
              Padding(padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 8.0,
              ),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 350,
                      height: 50,
                      child: TextFormField(
                        controller: namaLengkap,
                        decoration: InputDecoration(hintText: 'Nama Lengkap Pemesan'),
                        validator: (value){
                          if(value.trim().isEmpty){
                            return 'Nama Lengkap is Required';
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 8.0,
              ),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 350,
                      height: 50,
                      child: TextFormField(
                        controller: email,
                        decoration: InputDecoration(hintText: 'Email'),
                        validator: (value){
                          if(value.trim().isEmpty){
                            return 'Email is Required';
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 8.0,
              ),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 350,
                      height: 50,
                      child: TextFormField(
                        controller: noTelp,
                        decoration: InputDecoration(hintText: 'No. Telp'),
                        validator: (value){
                          if(value.trim().isEmpty){
                            return 'No. Telp is Required';
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 8.0,
              ),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 350,
                      height: 50,
                      child: TextFormField(
                        controller: alamat,
                        decoration: InputDecoration(hintText: 'Alamat'),
                        validator: (value){
                          if(value.trim().isEmpty){
                            return 'Alamat is Required';
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 8.0,
              ),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      height: 50,
                      child: TextFormField(
                        controller: kota,
                        decoration: InputDecoration(hintText: 'Kota'),
                        validator: (value){
                          if(value.trim().isEmpty){
                            return 'Kota is Required';
                          }
                        },
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 50,
                      child: TextFormField(
                        controller: kodePos,
                        decoration: InputDecoration(hintText: 'Kode Pos'),
                        validator: (value){
                          if(value.trim().isEmpty){
                            return 'Kode pos is Required';
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 8.0,
              ),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 350,
                      height: 50,
                      child: TextFormField(
                        controller: jumlahBarang,
                        decoration: InputDecoration(hintText: 'Jumlah Barang'),
                        validator: (value){
                          if(value.trim().isEmpty){
                            return 'Jumlah is Required';
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 8.0,
              ),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 350,
                      height: 50,
                      child: TextFormField(
                        controller: catatan,
                        decoration: InputDecoration(hintText: 'Catatan'),
                        validator: (value){
                          if(value.trim().isEmpty){
                            return 'Catatan is Required';
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 80.0,
                height: 10.0,
              ),
              RaisedButton(onPressed: (){
                Map <String,dynamic> data= {
                  "Nama Lengkap":namaLengkap.text,
                  "Email": email.text,
                  "No.Telp":noTelp.text,
                  "Alamat":alamat.text,
                  "Kota":kota.text,
                  "Kode Pos":kodePos.text,
                  "Jumlah Barang":jumlahBarang.text,
                  "Catatan":catatan.text
                };
                _firebaseServices.usersRef.doc(_firebaseServices.getUserId())
                .collection("Address").add(data);
                if(formKey.currentState.validate()) {
                  print('The Form is Valid');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PaymentMethod()
                    ),
                  );
                }
              },
                child: Text('submit'),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
