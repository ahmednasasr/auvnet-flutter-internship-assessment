import 'package:cloud_firestore/cloud_firestore.dart';
import 'data_service.dart';

class FirestoreServece implements DatebaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// Stores user data in a specific Firestore collection.
  /// Example use: Saving user info in the 'users' collection.
  @override
  Future<void> addData({
    required String ColoectionName,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(ColoectionName).doc(documentId).set(data);
    } else {
      // Add user data with an auto-generated ID
      await firestore.collection(ColoectionName).add(data);
    }
  }

  /// Retrieves user data from the specified collection by user ID (document ID).
  /// Example use: Getting a user's profile from the 'users' collection.
  @override
  Future<Map<String, dynamic>> getData({
    required String ColectionName,
    required String uId,
  }) async {
    var data = await firestore.collection(ColectionName).doc(uId).get();
    return data.data() as Map<String, dynamic>;
  }
}
