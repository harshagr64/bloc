import 'package:bloc_tut/login_bloc/models/data_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class SinginRepo {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<DataModel> signInuser(String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return DataModel.setData(credential.user.email);
      // credential.user.
    } on FirebaseAuthException catch (error) {
      throw Exception(error.code);
    }
  }

  Future<void> logoutUser() async {
    await _firebaseAuth.signOut();
    print('logged out');
    // print(DataModel('harsh').email);
  }
}
