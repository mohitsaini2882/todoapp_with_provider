import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthProvider{
  final FirebaseAuth _firebaseAuth;
  FirebaseAuthProvider(this._firebaseAuth);

  //SignUp with Email and Password
  signUpWithEmailPassword({required String email,required String password})async{
    try{
      UserCredential? userCredential =  await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      String Email =  userCredential.user!.email!;
      String Uid = userCredential.user!.uid;

    }on FirebaseAuthException catch (e){
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
  }

  //Login with Email and Password
  loginWithEmailPassword({required String email,required String password})async{
    try{
      UserCredential? userCredential =  await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch (e){
      print("Error in login : ${e.message}");
    }
  }

  //Delete Account
  deleteAccount()async{
    try{
      await _firebaseAuth.currentUser!.delete();
      return true;
    }on FirebaseAuthException catch (e){
      print("object");
      return false;
    }
  }

}