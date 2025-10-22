import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Auth state changes stream
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Sign in with Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      
      if (googleUser == null) {
        return null; // User cancelled the sign-in
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      
      // Check if user exists in Firestore, if not create new user document
      await _createUserIfNotExists(userCredential.user!);
      
      return userCredential;
    } catch (e) {
      print('Error signing in with Google: $e');
      return null;
    }
  }

  // Create user document in Firestore if not exists
  Future<void> _createUserIfNotExists(User user) async {
    try {
      final userDoc = await _firestore.collection('users').doc(user.uid).get();
      
      if (!userDoc.exists) {
        final userModel = UserModel(
          uid: user.uid,
          email: user.email ?? '',
          displayName: user.displayName ?? '',
          photoURL: user.photoURL,
          nama: user.displayName ?? '',
          jurusan: '',
          kelas: '',
          absen: '',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        
        await _firestore.collection('users').doc(user.uid).set(userModel.toMap());
      }
    } catch (e) {
      print('Error creating user document: $e');
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await Future.wait([
        _auth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  // Get user data from Firestore
  Future<UserModel?> getUserData(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        return UserModel.fromMap(doc.data()!);
      }
      return null;
    } catch (e) {
      print('Error getting user data: $e');
      return null;
    }
  }

  // Update user data
  Future<bool> updateUserData(UserModel userModel) async {
    try {
      final updatedUser = userModel.copyWith(updatedAt: DateTime.now());
      await _firestore.collection('users').doc(userModel.uid).update(updatedUser.toMap());
      return true;
    } catch (e) {
      print('Error updating user data: $e');
      return false;
    }
  }

  // Check if user profile is complete
  Future<bool> isUserProfileComplete(String uid) async {
    try {
      final userData = await getUserData(uid);
      if (userData == null) return false;
      
      // Check if required fields are filled (nama, jurusan, kelas, absen)
      return userData.nama.isNotEmpty && 
             userData.jurusan.isNotEmpty && 
             userData.kelas.isNotEmpty && 
             userData.absen.isNotEmpty;
    } catch (e) {
      print('Error checking user profile: $e');
      return false;
    }
  }

  // Check if user has basic profile (only nama from Google)
  Future<bool> hasBasicProfile(String uid) async {
    try {
      final userData = await getUserData(uid);
      if (userData == null) return false;
      
      // Check if at least nama is filled (from Google account)
      return userData.nama.isNotEmpty;
    } catch (e) {
      print('Error checking basic profile: $e');
      return false;
    }
  }
}
