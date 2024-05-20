import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:redditclone/core/utils.dart';
import 'package:redditclone/features/auth/models/auth_model.dart';
import 'package:redditclone/models/user_model.dart';

final userProvider = StateProvider<UserModel?>((ref) => null);

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
      (ref) => AuthController(
    authModel: ref.watch(authModelProvider),
    ref: ref,
  ),
);

final authStateChangeProvider = StreamProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.authStateChange;
});

final getUserDataProvider = StreamProvider.family((ref, String uid) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getUserData(uid);
});

class AuthController extends StateNotifier<bool> {
  final AuthModel _authModel;
  final Ref _ref;
  AuthController({required AuthModel authModel, required Ref ref})
      : _authModel = authModel,
        _ref = ref,
        super(false); // loading

  Stream<User?> get authStateChange => _authModel.authStateChange;

  void signInWithGoogle(BuildContext context, bool isFromLogin) async {
    state = true;
    final user = await _authModel.signInWithGoogle(isFromLogin);
    state = false;
    user.fold(
          (l) => showSnackBar(context, l.message),
          (userModel) => _ref.read(userProvider.notifier).update((state) => userModel),
    );
  }

  void signInWithApple(BuildContext context, bool isFromLogin) async {
    state = true;
    final user = await _authModel.signInWithApple(isFromLogin);
    state = false;
    user.fold(
          (l) => showSnackBar(context, l.message),
          (userModel) => _ref.read(userProvider.notifier).update((state) => userModel),
    );
  }

  void signInWithEmailAndPassword(BuildContext context, String email, String password) async {
    state = true;
    final user = await _authModel.signInWithEmailAndPassword(email, password);
    state = false;
    user.fold(
          (l) => showSnackBar(context, l.message),
          (userModel) => _ref.read(userProvider.notifier).update((state) => userModel),
    );
  }

  void createAccountWithEmailAndPassword(BuildContext context, String email, String password) async {
    state = true;
    final user = await _authModel.createAccountWithEmailAndPassword(email, password);
    state = false;
    user.fold(
          (l) => showSnackBar(context, l.message),
          (userModel) => _ref.read(userProvider.notifier).update((state) => userModel),
    );
  }

  void signInAsGuest(BuildContext context) async {
    state = true;
    final user = await _authModel.signInAsGuest();
    state = false;
    user.fold(
          (l) => showSnackBar(context, l.message),
          (userModel) => _ref.read(userProvider.notifier).update((state) => userModel),
    );
  }

  Stream<UserModel> getUserData(String uid) {
    return _authModel.getUserData(uid);
  }

  void logout() async {
    _authModel.logOut();
  }
}
