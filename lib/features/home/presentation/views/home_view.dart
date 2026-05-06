import 'package:ayadati/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () async {
            await GoogleSignIn().signOut();
            Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.loginView,(route) => false,);
          },
          child: Text('home view', style: TextStyle(color: Colors.amber)),
        ),
      ),
    );
  }
}
