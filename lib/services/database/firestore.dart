import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');

  final CollectionReference user =
      FirebaseFirestore.instance.collection('users');

  // save orders to db
  Future<void> saveOrderToDatabase(String receipt) async {
    await orders.add({
      "date": DateTime.now(),
      "order": receipt,
    });
  }

  // save orders to db
  Future<void> getCurrentUserFromDatabase(String email) async {
    user.where(user.id == email);
  }
}
