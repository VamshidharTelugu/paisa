import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:paisa/utilities/constants.dart';

class DatabaseMethods {
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return Container();
        } else {}
      },
    );
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }

  signIn(AuthCredential authCredential) async {
   AuthResult result = await FirebaseAuth.instance.signInWithCredential(authCredential);
   FirebaseUser user = result.user;
   if(user != null){
     isLoggedIn = true;
     return true;
   }
   else{
     print("verificationFailed");
     return false;
   }
    
  }

  signInWithOTP (smsCode, verId) async{
    AuthCredential authCreds = PhoneAuthProvider.getCredential(verificationId: verId, smsCode: smsCode);
   // signIn(authCreds);
  AuthResult result = await FirebaseAuth.instance.signInWithCredential(authCreds);
   FirebaseUser user = result.user;
   if(user != null){
     isLoggedIn = true;
     return true;
   }
   else{
     print("verificationFailed");
     return false;
   }
  }
}
