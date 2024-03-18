import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneText;
  final String profilePic;

  UserData({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneText,
    required this.profilePic,
  });

  factory UserData.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return UserData(
        firstName: data['firstName'],
        lastName: data['LastName'],
        email: data['email'],
        phoneText: data['phoneText'],
        profilePic: data['profilePic']);
  }

  Map<String, String> toMap() {
    return {
      'firstName': firstName,
      'LastName': lastName,
      'email': email,
      'phoneText': phoneText,
      'profilePic': profilePic,
    };
  }
}
