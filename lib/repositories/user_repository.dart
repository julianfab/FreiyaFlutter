import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_database/firebase_database.dart';

class UserRepository {

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FacebookLogin _facebookLogin;
  final DatabaseReference dbRef = FirebaseDatabase.instance.reference();

  UserRepository({FirebaseAuth firebaseAuth, GoogleSignIn googleSignIn, FacebookLogin facebookLogin, FirebaseAuth otherFirebaseAuth})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
    _googleSignIn =googleSignIn ?? GoogleSignIn(),
    _facebookLogin =facebookLogin ?? FacebookLogin();

  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    if (googleUser ==null) {
      return null;
    }
    final GoogleSignInAuthentication googleAuth =await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    AuthResult authResult =await _firebaseAuth.signInWithCredential(credential);
    createUserInDB(authResult.user);
    return _firebaseAuth.currentUser();
  }

  Future<FirebaseUser> signInWithFacebook() async {
    final result = await _facebookLogin.logIn(['email']);
    if (result.status !=FacebookLoginStatus.loggedIn) {
      return null;
    }
    
    final AuthCredential credential = FacebookAuthProvider.getCredential(
      accessToken: result.accessToken.token,
    );

    AuthResult authResult = await _firebaseAuth.signInWithCredential(credential);
    createUserInDB(authResult.user);
    return _firebaseAuth.currentUser();

  }

  Future<void> signInWithCredentials(String email, String password) async{
    AuthResult authResult = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    
    createUserInDB(authResult.user);
    return _firebaseAuth.currentUser();
  }

  Future<void> signUp(String email, String password, String fullName) async {
    UserUpdateInfo userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = fullName;
    AuthResult authResult = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    authResult.user.updateProfile(userUpdateInfo);
    FirebaseUser user = await _firebaseAuth.currentUser();
    createUserInDB(user);
    return authResult.user.updateProfile(userUpdateInfo);
  }

  void updateFullName(String fullName) async {
    UserUpdateInfo userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = fullName;
    FirebaseUser user = await getFirebaseUser();
    user.updateProfile(userUpdateInfo);
  }

  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
      _facebookLogin.logOut(),
      

    ]);
  }

  Future<bool> isSignedIn() async {
    final currenUser = await _firebaseAuth.currentUser();
    return currenUser != null;
  }
  
  Future<String> getUser() async {
    return(await _firebaseAuth.currentUser()).email;
  }

  Future<FirebaseUser> getFirebaseUser() async {
    return await _firebaseAuth.currentUser();
  }

  void createUserInDB(FirebaseUser userIn) async {
    print('ENTRO A DB');
    final firebaseUser = userIn;
    //final firebaseUser = await _firebaseAuth.currentUser();
    print(firebaseUser);
    print(firebaseUser.uid);
    print(firebaseUser.displayName);


    dbRef.child('Users').child('${firebaseUser.uid}').once().then((DataSnapshot dataSnapshot){
      if (dataSnapshot.value == null) {
        dbRef.child('Users').child('${firebaseUser.uid}').set({
          'nombre':'${firebaseUser.displayName}',
          'puntaje':0
        });
      }
    }).catchError((e){
      print('Error user_repository.dart, funcion createUserInDB, ERROR : '+e);
    });
    
  }


}