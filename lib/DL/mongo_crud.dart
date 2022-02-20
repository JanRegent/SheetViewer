// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_mongodb_realm/flutter_mongo_realm.dart';

// final MongoRealmClient client = MongoRealmClient();

// Future<void> insertData() async {
//   var collection = client.getDatabase("test").getCollection("my_collection");

//   try {
// //      var document = MongoDocument({
// //        "time": DateTime.now().millisecondsSinceEpoch,
// //        "name": "hadar",
// //        "age": 27,
// //        "dogs": [
// //          "shocko",
// //          "nuna"
// //        ]
// //      });
// //
// //      collection.insertOne(document);

//     collection.insertMany([
//       MongoDocument({
//         "time": DateTime.now().millisecondsSinceEpoch,
//         "username": "moshe",
//         "grades": [90, 98],
//       }),
//       MongoDocument({
//         "time": DateTime.now().millisecondsSinceEpoch,
//         "username": "adiel",
//         "age": [77, 55, 91],
//       }),
//     ]);
//   } on PlatformException {
//     debugPrint("Error!!!");
//   }
// }
