import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:movie_app_intern_intelligence/watchlist/presentation/controllers/watchlist_bloc/watchlist_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/domain/entities/media.dart';
import 'core/resources/app_router.dart';
import 'core/resources/app_strings.dart';
import 'core/resources/app_theme.dart';
import 'core/services/service_locator.dart';



void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MediaAdapter());
  await Hive.openBox('items');
  ServiceLocator.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>getIt<WatchlistBloc>(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appTitle,
        theme: getApplicationTheme(),
        routerConfig: AppRouter().router,
      ),
    );
  }
}
