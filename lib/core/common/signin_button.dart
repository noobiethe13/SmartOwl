import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:redditclone/core/constants/constants.dart';
import 'package:redditclone/features/auth/controllers/auth_controller.dart';
import 'package:redditclone/theme/palette.dart';

class SignInButton extends ConsumerWidget {
  final bool isFromLogin;
  const SignInButton({Key? key, this.isFromLogin = true}) : super(key: key);

  void signInWithGoogle(BuildContext context, WidgetRef ref) {
    ref.read(authControllerProvider.notifier).signInWithGoogle(context, isFromLogin);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () => signInWithGoogle(context, ref),
            icon: Image.asset(
              Constants.googleLogoPath,
              width: 35,
            ),
            label: const Text(
              'Continue with Google',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Palette.greyColor,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton.icon(
            onPressed: (){}, // => signInWithGoogle(context, ref),
            icon: Image.asset(
              Constants.appleLogoPath,
              width: 35,
            ),
            label: const Text(
              'Continue with Apple',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Palette.greyColor,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton.icon(
            onPressed: (){}, // => signInWithGoogle(context, ref),
            icon: Image.asset(
              Constants.emailLogoPath,
              width: 35,
            ),
            label: const Text(
              'Continue with email',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Palette.greyColor,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
