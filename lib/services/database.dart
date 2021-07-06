import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods
{
  uploadUserinfo(userMap){
    FirebaseFirestore.instance.collection("users")
    .add(userMap);
  }
}