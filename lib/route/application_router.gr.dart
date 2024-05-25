// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/cupertino.dart' as _i4;
import 'package:pokedex/presentation/models/pokemon_model.dart' as _i5;
import 'package:pokedex/presentation/views/home.dart' as _i1;
import 'package:pokedex/presentation/views/pokemon_detail.dart' as _i2;

abstract class $ApplicationRouter extends _i3.RootStackRouter {
  $ApplicationRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    PokemonDetailRoute.name: (routeData) {
      final args = routeData.argsAs<PokemonDetailRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.PokemonDetailPage(
          key: args.key,
          pokemon: args.pokemon,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PokemonDetailPage]
class PokemonDetailRoute extends _i3.PageRouteInfo<PokemonDetailRouteArgs> {
  PokemonDetailRoute({
    _i4.Key? key,
    required _i5.PokemonModel pokemon,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          PokemonDetailRoute.name,
          args: PokemonDetailRouteArgs(
            key: key,
            pokemon: pokemon,
          ),
          initialChildren: children,
        );

  static const String name = 'PokemonDetailRoute';

  static const _i3.PageInfo<PokemonDetailRouteArgs> page =
      _i3.PageInfo<PokemonDetailRouteArgs>(name);
}

class PokemonDetailRouteArgs {
  const PokemonDetailRouteArgs({
    this.key,
    required this.pokemon,
  });

  final _i4.Key? key;

  final _i5.PokemonModel pokemon;

  @override
  String toString() {
    return 'PokemonDetailRouteArgs{key: $key, pokemon: $pokemon}';
  }
}
