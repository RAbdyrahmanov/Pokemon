import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:poke_ap/features/auth/presentation/auth_screen.dart';
import 'package:poke_ap/features/home/presentation/home_screen.dart';
import 'package:poke_ap/features/pokemon_datails/presentation/pokemon_details_screen.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AuthRoute.page,initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: PokemonDetailsRoute.page),
      ];
}
