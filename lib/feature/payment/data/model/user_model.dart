class UserModel {
  final String name;
  final String email;

  UserModel({required this.name, required this.email});
  Map<String, String> toJson() {
    return {'name': name, 'email': email};
  }
}
