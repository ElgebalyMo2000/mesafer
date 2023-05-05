class UserDataModel {
  String? firstName;
  String? lastName;
  String? dateOfBirth;
  String? gender;
  String? nationalId;
  String? phoneNumber;
  String? email;
  String? password;
  

  UserDataModel(
      {required this.firstName,
      required this.lastName,
      required this.dateOfBirth,
      required this.gender,
      required this.nationalId,
      required this.phoneNumber,
      required this.email,
      this.password,});
}
