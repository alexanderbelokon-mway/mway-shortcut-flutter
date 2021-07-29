class LoginState {
  final bool? loading;

  LoginState({required this.loading});

  LoginState copyWith({bool? loading}) {
    return LoginState(loading: loading ?? this.loading);
  }
}
