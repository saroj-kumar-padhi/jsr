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