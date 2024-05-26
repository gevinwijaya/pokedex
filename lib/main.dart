import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/di/di.dart';
import 'package:pokedex/route/application_router.dart';

void main() async {
  await configureDependencies();
  runApp(GlobalBlocProviders(child: MainApp()));
}

class MainApp extends StatelessWidget {
  final ApplicationRouter _applicationRouter = ApplicationRouter();

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig: _applicationRouter.config(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.lexendDecaTextTheme(),
        ));
  }
}
