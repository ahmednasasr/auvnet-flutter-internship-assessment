import 'package:firebase_auth/firebase_auth.dart';

import '../errors/exceptions.dart';

class FirebaseAuthService {

  // fun of create user with email and password
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException("كلمة المرور التي أدخلتها ضعيفة جدًا.");
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('هذا البريد الإلكتروني مستخدم بالفعل.');
      } else {
        throw CustomException("حدث خطأ، يرجى المحاولة مرة أخرى لاحقًا.");
      }
    } catch (e) {
      throw CustomException("حدث خطأ، يرجى المحاولة مرة أخرى لاحقًا.");
    }
  }

  // fun of sign in with email and password

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException("لا يوجد مستخدم بهذا البريد الإلكتروني.");
      } else if (e.code == 'wrong-password') {
        throw CustomException("كلمة المرور غير صحيحة.");
      } else {
        throw CustomException("حدث خطأ، يرجى المحاولة مرة أخرى لاحقًا.");
      }
    } catch (e) {
      throw CustomException("حدث خطأ، يرجى المحاولة مرة أخرى لاحقًا.");
    }
  }

  // fun of delete user used when an error occurs during sign up or sign in

  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  // fun of sign out user

  bool loggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
