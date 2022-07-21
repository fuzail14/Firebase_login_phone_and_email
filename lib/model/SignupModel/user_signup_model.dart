class UserSignupModel {
  String? uid;

  String? firstname;
  String? lastname;
  String? phoneNumber;

  String? userRole;

  UserSignupModel(
      {this.uid,
      this.firstname,
      this.lastname,
      this.phoneNumber,
      this.userRole});

  //recieve data from server

  factory UserSignupModel.fromMap(map) {
    return UserSignupModel(
        uid: map['uid'],
        firstname: map['firstname'],
        lastname: map['lastname'],
        phoneNumber: map['phoneNumber'],
        userRole: map['userRole']);
  }

  //sending data to our server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstname': firstname,
      'lastname': lastname,
      'phoneNumber': phoneNumber,
      'userRole': userRole
    };
  }
}
