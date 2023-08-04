import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_v7_actual/layout/default_layout.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              context.go('/basic');
            },
            child: Text(
              'Go Basic',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed('named_screen');
            },
            child: Text(
              'Go Named',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/push');
            },
            child: Text(
              'Go Push',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/path_param/123');
            },
            child: Text(
              'Go PathParam',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/query_param');
            },
            child: Text(
              'Go Query Param',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/nested/a');
            },
            child: Text(
              'Go Nested',
            ),
          ),
        ],
      ),
    );
  }
}
