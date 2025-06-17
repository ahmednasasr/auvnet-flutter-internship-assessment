
import 'package:cloud_firestore/cloud_firestore.dart';

import 'data_service.dart';

class FirestoreServece implements DatebaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData(
      {required String ColoectionName,
      required Map<String, dynamic> data,
      String? documentId}) async {
    if (documentId != null) {
      await firestore.collection(ColoectionName).doc(documentId).set(data);
    } else {
      await firestore.collection(ColoectionName).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String ColectionName, required String uId}) async {
    var data = await firestore.collection(ColectionName).doc(uId).get();
    return data.data() as Map<String, dynamic>;
  }
}
