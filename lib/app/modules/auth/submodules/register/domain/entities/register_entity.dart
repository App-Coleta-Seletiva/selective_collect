class RegisterEntity {
  final String email;
  final String password;
  final String? uuid;

  RegisterEntity(
    this.uuid, {
    required this.email,
    required this.password,
  });
}
