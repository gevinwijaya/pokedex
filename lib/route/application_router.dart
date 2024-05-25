import 'package:auto_route/auto_route.dart';
import 'package:pokedex/route/application_router.gr.dart';

@AutoRouterConfig()
class ApplicationRouter extends $ApplicationRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: PokemonDetailRoute.page)
  ];

  @override
  RouteType get defaultRouteType => const RouteType.custom(
    transitionsBuilder: TransitionsBuilders.fadeIn
  );
}