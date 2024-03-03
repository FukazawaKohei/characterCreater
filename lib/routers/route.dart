import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:character_creater/pages/characterEdit.dart';
import 'package:character_creater/pages/characterList.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => CharacterList(),
    ),
    GoRoute(
      path: '/edit',
      builder: (BuildContext context, GoRouterState state) =>
          CharacterEdit(state.extra as int?),
    ),
  ],
);
