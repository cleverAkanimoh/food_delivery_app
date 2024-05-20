import 'package:cloud_firestore/cloud_firestore.dart';

import '../auth/auth_service.dart';

class FireStoreService {
  final loggedInUser = AuthService().getCurrentUser();

  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  // save orders to db
  Future<void> saveOrderToDatabase(String receipt) async {
    await orders.add({
      "date": DateTime.now(),
      "order": receipt,
    });
  }

  // save orders to db
  Future getCurrentUserFromDatabase() async {
    return await users
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              element.data();
            },),);
  }
}
