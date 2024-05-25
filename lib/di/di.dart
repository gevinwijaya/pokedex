import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/di/di.config.dart';
import 'package:pokedex/presentation/states/pokedex_bloc.dart';
import 'package:pokedex/presentation/states/pokedex_event.dart';

final getIt = GetIt.instance;

@InjectableInit()
FutureOr<void> configureDependencies() => getIt.init();

@module
abstract class RegisterModule {
  @singleton
  Dio get dio => Dio();
}

class GlobalBlocProviders extends StatelessWidget {
  final Widget child;

  const GlobalBlocProviders({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokedexBloc>(
          create: (context) => getIt.get<PokedexBloc>()..add(FetchItems()),
        ),
      ],
      child: child,
    );
  }
}
