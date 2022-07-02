// ignore_for_file: use_build_context_synchronously

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_notes/utilites/routes.dart';
import 'package:my_notes/utilites/success_dialog.dart';

import '../firebase_options.dart';
import '../utilites/error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Column(
        children: [
          TextField(
            controller: _email,
            autocorrect: false,
            enableSuggestions: false,
            keyboardType: TextInputType.emailAddress,
            decoration:
                const InputDecoration(hintText: "Enter your email here"),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration:
                const InputDecoration(hintText: "Enter your password here"),
          ),
          TextButton(
            onPressed: () async {
              await Firebase.initializeApp(
                options: DefaultFirebaseOptions.currentPlatform,
              );
              final email = _email.text;
              final password = _password.text;
              try {
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: email,
                  password: password,
                );
                User? user = FirebaseAuth.instance.currentUser;
                if (user!.emailVerified) {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(home, (route) => false);
                } else {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(verifyView, (route) => false);
                }
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  await showErrorDialog(
                    context,
                    "User not found",
                  );
                } else if (e.code == 'wrong-password') {
                  await showErrorDialog(
                    context,
                    "Wrong password",
                  );
                } else {
                  await showErrorDialog(
                    context,
                    "Failed: ${e.code}",
                  );
                }
              } catch (e) {
                await showErrorDialog(
                  context,
                  "Failed: ${e.toString}",
                );
              }
            },
            child: const Text("Login"),
          ),
          TextButton(
              onPressed: () async {
                await Firebase.initializeApp(
                  options: DefaultFirebaseOptions.currentPlatform,
                );
                final email = _email.text;
                try {
                  await FirebaseAuth.instance.sendPasswordResetEmail(
                    email: email,
                  );
                  showSuccessDialog(
                      context, 'Check your mail spam folder to get mail');
                } on FirebaseAuthException catch (e) {
                  showErrorDialog(context, e.code.replaceAll('-', ' '));
                } catch (e) {
                  showErrorDialog(context, e.toString());
                }
              },
              child: const Text('Forgot Password?')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  register,
                  (route) => false,
                );
              },
              child: const Text('Not Registeres yet? Register here'))
        ],
      ),
    );
  }
}
