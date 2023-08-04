import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_v7_actual/layout/default_layout.dart';

class NestedScreen extends StatelessWidget {
  final Widget child;

  const NestedScreen({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${GoRouterState.of(context).location}'),
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: switch (GoRouterState.of(context).location) {
          '/nested/a' => 0,
          '/nested/b' => 1,
          _ => 2,
        },
        onTap: (index) {
          (index == 0)
              ? context.go('/nested/a')
              : (index == 1)
                  ? context.go('/nested/b')
                  : context.go('/nested/c');
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'person',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'notifications',
          ),
        ],
      ),
    );
  }
}
