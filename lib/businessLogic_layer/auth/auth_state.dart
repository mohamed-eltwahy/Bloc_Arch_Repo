
class AuthInitial extends AuthState {}


class AuthState {
  final bool isLoggedIn;
  final String? error;

  AuthState({
    this.isLoggedIn = false,
    this.error,
  });

  AuthState copyWith({bool? isLoggedIn, String? error}) {
    return AuthState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      error: error ?? this.error,
    );
  }



  factory AuthState.initial() => AuthState();


}
