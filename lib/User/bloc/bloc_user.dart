import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_repository.dart';

class BlocUser implements Bloc {
  final _auth_repository = AuthRepository();

  // flujo de datos - Streams
  // Stream - Firebase
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;

  Stream<FirebaseUser> get authStatus => streamFirebase;

  // Casos de uso
  // 1.- sigin a la app
  Future<FirebaseUser> signIn() {
    return _auth_repository.signInFirebase();
  }

  // 2 sign out
  signOut() {
    _auth_repository.signOut();
  }

  // 3 registrar usuario en db
  final _cloudFirestoreRepository = CloudFirestoreRepository();

  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);

  @override
  void dispose() {
    // TODO: implement dispose
  }

}