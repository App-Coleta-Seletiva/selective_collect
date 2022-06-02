class RegisterEntity {
  final int?
      id; //* um novo usuário não possui id antes de ser salvo na base de dados?
  final String email;
  final String username;
  final String
      uuid; //* um novo usuário não possui uuid antes de ser cadastrado na api de login?

  RegisterEntity({
    this.id,
    required this.email,
    required this.username,
    required this.uuid,
  });
}


// dados  -> firebase
// modulo -> hasura
