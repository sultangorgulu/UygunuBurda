import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uygunuburda/util/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  String get fullname => '$firstName $lastName';

  String get formattedPhoneno => AppFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullname) => fullname.split(" ");

  static String generateUsername(fullname) {
    List<String> nameParts = fullname.split(" ");

    String firstname = nameParts[0].toLowerCase();
    String lastname = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    String camelCaseUserName = '$firstname$lastname';
    String usernameWithPrefix = "cwt_$camelCaseUserName";
    return usernameWithPrefix;
  }

  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        username: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
      );

  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  // factory UserModel.fromSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> document) {
  //   if (document.data() != null) {
  //     final data = document.data()!;
  //     return UserModel(
  //       id: document.id,
  //       firstName: data['FirstName'] ?? '',
  //       lastName: data['LastName'] ?? '',
  //       username: data['Username'] ?? '',
  //       email: data['Email'] ?? '',
  //       phoneNumber: data['PhoneNumber'] ?? '',
  //       profilePicture: data['ProfilePicture'] ?? '',
  //     );
  //   } else {
  //     return UserModel(
  //       id: '',
  //       firstName: '',
  //       lastName: '',
  //       username: '',
  //       email: '',
  //       phoneNumber: '',
  //       profilePicture: '',
  //     );
  //   }
  // }

  UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : firstName = snapshot.data()!['FirstName'] ?? '',
        lastName = snapshot.data()!['LastName'] ?? '',
        username = snapshot.data()!['Username'] ?? '',
        phoneNumber = snapshot.data()!['PhoneNumber'] ?? '',
        profilePicture = snapshot.data()!['ProfilePicture'] ?? '',
        id = snapshot.id,
        email = snapshot.data()!['Email'] ?? '';
}