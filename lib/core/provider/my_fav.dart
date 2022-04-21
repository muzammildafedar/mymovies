import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mymovies/core/provider/firebase_auth.dart';
import 'package:mymovies/core/services/firecloude_setup.dart';

class MyFavMovies extends ChangeNotifier implements InitFirebase {
  @override
  final firebaseCall = FirebaseFirestore.instance;
  final _auth = Auth();
  @override
  void profileSetup(
      String? fname,
      String? lname,
      String? mnumber,
      String? dob,
      String? address,
      String? ds,
      String? stream,
      String? passy,
      String? cname) {
    print(fname);
    firebaseCall.collection("users").add({
      "fname": "$fname",
      "lname": "$lname",
      "mnumber": "$mnumber",
      "email": "${_auth.auth.currentUser?.email}",
      "address": "$address",
      "dob": "$dob",
      "degree/school": "$ds",
      "stream": "$stream",
      "passing_year": "$passy",
      "college_name": "$cname",
    }).then((value) => print(value.id));
    // TODO: implement profileSetup
  }

  checkProfileDataExisted(String? email) {
    int length;
    var data = FirebaseFirestore.instance
        .collection('users')
        .where("email", isEqualTo: email)
        .get();
    print(data);

    // return length;
  }
}
