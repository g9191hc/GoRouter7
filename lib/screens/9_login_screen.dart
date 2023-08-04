import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_v7_actual/route/router.dart';

import '../layout/default_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          Text('Login State : $authState'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                authState = !authState;
              });
            },
            child: Text(authState == true ? 'logout' : 'login'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/login/private');
            },
            child: Text('Go to Private Route'),
          ),
        ],
      ),
    );
  }
}
