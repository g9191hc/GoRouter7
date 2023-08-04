import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_v7_actual/screens/10_transition_screen_1.dart';
import 'package:go_router_v7_actual/screens/11_error_screen.dart';
import 'package:go_router_v7_actual/screens/2_named_screen.dart';
import 'package:go_router_v7_actual/screens/0_root_screen.dart';
import 'package:go_router_v7_actual/screens/3_push_screen.dart';
import 'package:go_router_v7_actual/screens/4_pop_base_screen.dart';
import 'package:go_router_v7_actual/screens/5_pop_return_screen.dart';
import 'package:go_router_v7_actual/screens/6_path_param_screen.dart';
import 'package:go_router_v7_actual/screens/7_query_param_screen.dart';
import 'package:go_router_v7_actual/screens/8_nested_screen.dart';
import 'package:go_router_v7_actual/screens/9_login_screen.dart';
import 'package:go_router_v7_actual/screens/9_private_screen.dart';
import '../screens/10_transition_screen_2.dart';
import '../screens/1_basic_screen.dart';
import '../screens/8_nested_child_screen.dart';

//로그인 상태 여부
bool authState = false;

final router = GoRouter(
  //routes의 모든 라우트의 path호출시에 먼저 체크함
  redirect: (context, state) {
    if (state.location == '/login/private' && authState == false)
      return '/login';
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => RootScreen(),
      routes: [
        GoRoute(
          path: 'basic',
          builder: (context, state) => BasicScreen(),
        ),
        GoRoute(
          path: 'named',
          name: 'named_screen',
          builder: (context, state) => NamedScreen(),
        ),
        GoRoute(
          path: 'push',
          builder: (context, state) => PushScreen(),
        ),
        GoRoute(
          path: 'pop',
          builder: (context, state) => PopBaseScreen(),
          routes: [
            GoRoute(
              path: 'return',
              builder: (context, state) => PopReturnScreen(),
            ),
          ],
        ),
        GoRoute(
          path: 'path_param/:id',
          builder: (context, state) => PathParamScreen(),
        ),
        GoRoute(
          path: 'query_param',
          builder: (context, state) => QueryParamScreen(),
        ),
        GoRoute(
          path: 'query_param',
          builder: (context, state) => QueryParamScreen(),
        ),
        ShellRoute(
          builder: (context, state, child) => NestedScreen(child: child),
          routes: [
            GoRoute(
              path: 'nested/a',
              builder: (_, state) => NestedChildScreen(
                routeName: '/nested/a',
              ),
            ),
            GoRoute(
              path: 'nested/b',
              builder: (_, state) => NestedChildScreen(
                routeName: '/nested/b',
              ),
            ),
            GoRoute(
              path: 'nested/c',
              builder: (_, state) => NestedChildScreen(
                routeName: '/nested/c',
              ),
            ),
          ],
        ),
        GoRoute(
          path: 'login',
          builder: (_, state) => LoginScreen(),
          routes: [
            GoRoute(
              // 현재 라우트의 path호출시에만 먼저 체크함
              redirect: (context, state) {
                if (authState == false) {
                  return '/login';
                }
                return null;
              },
              path: 'private',
              builder: (_, state) => PrivateScreen(),
            ),
          ],
        ),
        GoRoute(
          path: 'transition',
          builder: (_, state) => TransitionScreenOne(),
          routes: [
            GoRoute(
              path: 'detail',
              pageBuilder: (_, state) => CustomTransitionPage(
                child: TransitionScreenTwo(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  //페이드
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );

                  // //확대/축소
                  // return ScaleTransition(
                  //   scale: animation,
                  //   child: child,
                  // );

                  // // 회전
                  // return RotationTransition(
                  //   turns: animation,
                  //   child: child,
                  // );
                },
                // transitionDuration: Duration(seconds: 3),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => ErrorScreen(error: state.error.toString()),
  debugLogDiagnostics: true,
);
