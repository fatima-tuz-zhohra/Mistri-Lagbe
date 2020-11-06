import 'package:firebase_database/firebase_database.dart';
import 'user/user.dart';

final databaseReference = FirebaseDatabase.instance.reference();

void saveUser(User user) {
  var users = databaseReference.child('users/');
  users.push().set(user);
}

