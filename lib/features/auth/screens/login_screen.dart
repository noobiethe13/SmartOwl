import 'package:flutter/material.dart';
import 'package:redditclone/core/common/signin_button.dart';
import 'package:redditclone/core/constants/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(Constants.logoPath, height: 40),
            const SizedBox(width: 5,),
            const Text("SmartOwl", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          ],
        ),
        actions: [
          TextButton(onPressed: (){},
              child: Text("Skip", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.indigo[600])))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            const Text("All the Knowledge You Need", style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Image.asset(Constants.loginImagePath, height: 350,)),
            ),
            const SizedBox(height: 20,),
            const SignInButton(),
          ],
        ),
      ),
    );
  }
}
