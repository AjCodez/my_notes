import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/utilites/routes.dart';
import 'package:my_notes/utilites/success_dialog.dart';

import '../firebase_options.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify your email')),
      body: Column(
        children: [
          const Text(
              "Click here to verify your email! Please check your spam folder of mail to get verification link."),
          TextButton(
              onPressed: () async {
                await Firebase.initializeApp(
                  options: DefaultFirebaseOptions.currentPlatform,
                );
                User? user = FirebaseAuth.instance.currentUser;
                await user?.sendEmailVerification();
                await FirebaseAuth.instance.signOut();
                await showSuccessDialog(context, 'Sent on mail');
              },
              child: const Text("Send verification email")),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(login, (route) => false);
              },
              child: const Text("Verified? Go back to login")),
        ],
      ),
    );
  }
}
