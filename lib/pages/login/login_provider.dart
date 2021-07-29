import 'package:flutter_image_detection/pages/login/login_state.dart';
import 'package:flutter_image_detection/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginNotifierProvider =
    StateNotifierProvider<LoginStateNotifier, LoginState>(
  (ref) => LoginStateNotifier(ref.read(authServiceProvider)),
);

class LoginStateNotifier extends StateNotifier<LoginState> {
  final AuthService _authService;

  LoginStateNotifier(this._authService) : super(LoginState(loading: false));

  // Start here
  signIn() {}
}
