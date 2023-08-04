import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_v7_actual/layout/default_layout.dart';

class QueryParamScreen extends StatelessWidget {
  const QueryParamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          Text(
            'Query parameter : ${GoRouterState.of(context).queryParameters}',
          ),
          ElevatedButton(
            onPressed: () {
              context.push(
                Uri(
                  path: '/query_param',
                  queryParameters: {
                    'name': 'issac',
                    'age': '33',
                  },
                ).toString(),
              );
            },
            child: Text(
              'QueryParameter',
            ),
          ),
        ],
      ),
    );
  }
}
