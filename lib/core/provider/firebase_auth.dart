import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;

  bool get isSignedIn => auth.currentUser != null;
  String? name;
  String? email;
  String? mobileNumber;
  String? displayImg;
  String? uid;
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    print(FirebaseAuth.instance.signInWithCredential(credential));

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  getUserDetails() {
    final User? user = auth.currentUser;
    // print(auth.currentUser);

    name = user?.displayName.toString();
    email = user?.email;
    mobileNumber = user?.phoneNumber;
    displayImg = user?.photoURL;
    uid = user?.uid;
    // print("Have session");
    // print(name);
    notifyListeners();
  }

  Future<void> googleSignOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
