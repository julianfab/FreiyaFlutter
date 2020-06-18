import 'package:flutter/material.dart';
//import 'dart:async';
//import 'package:meta/meta.dart';
import 'package:firebase_database/firebase_database.dart';


class ScannerButton extends StatelessWidget {
  final DatabaseReference dBRef = FirebaseDatabase.instance.reference();
  //final String _uid;

  /*void _pushScreen(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => screen),
    );
  }*/

  ScannerButton({Key key, @required String uidIn})
  : assert(uidIn != null),
    //_uid = uidIn,
    super(key:key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.white,
      onPressed:(){
        createUserInDB();
      },// _pushScreen(context, TestPage()),
      child: Row(
        children: <Widget>[
          Icon(Icons.filter_center_focus),
          Text(
            'Escaner Codigo QR',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      )
    );
  }

  void createUserInDB() {
    //final firebaseUser = await getFirebaseUser();
    /*DBRef.child('Users').child('${firebaseUser.uid}').set({
      'nombre':'${firebaseUser.displayName}',
      'puntaje':0
    });
    DBRef.child("1").set({
      'id':'id1',
      'data':'thisexample'
    });DBRef.once().then((DataSnapshot dataSnapshot){
      print(dataSnapshot.value);
    });
    */
    //dBRef.child('Users').push().
    print('object');
    print(dBRef.child('Users').child('123').once().then((DataSnapshot dataSnapshot){
      print(dataSnapshot.value);
    }));
    
  }

}