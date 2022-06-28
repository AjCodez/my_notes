import 'package:flutter/material.dart';
import 'package:my_notes/utilites/routes.dart';
import 'package:my_notes/views/home_page.dart';
import 'package:my_notes/views/login_view.dart';
import 'package:my_notes/views/register_view.dart';
import 'package:my_notes/views/verified_email_view.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        login: (context) => const LoginView(),
        register: (context) => const RegisterView(),
        home: (context) => const HomePage(),
        verify_view: (context) => const VerifyEmailView(),
      },
    ),
  );
}
