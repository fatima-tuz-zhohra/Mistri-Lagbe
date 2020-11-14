import 'package:firebase_database/firebase_database.dart';
import 'user/app_user.dart';

final databaseReference = FirebaseDatabase.instance.reference();

void saveUser(AppUser user) {
  var users = databaseReference.child('users/');
  users.push().set(user.toJson());
}

