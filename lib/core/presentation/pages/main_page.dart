import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../resources/app_router.dart';
import '../../resources/app_routes.dart';
import '../../resources/app_strings.dart';
import '../../resources/app_values.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          final String location = GoRouterState.of(context).uri.toString();
          if (!location.startsWith(moviesPath)) {
            _onItemTapped(0, context);
          }
          return true;
        },
        child: widget.child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        items: const [
          BottomNavigationBarItem(
            label: AppStrings.home,
            icon: Icon(
              Icons.home,
              size: AppSize.s20,
            ),
          ),
          // BottomNavigationBarItem(
          //   label: AppStrings.shows,
          //   icon: Icon(
          //     Icons.tv_rounded,
          //     size: AppSize.s20,
          //   ),
          // ),
          BottomNavigationBarItem(
            label: AppStrings.search,
            icon: Icon(
              Icons.search_rounded,
              size: AppSize.s20,
            ),
          ),
          BottomNavigationBarItem(
            label: AppStrings.saved,
            icon: Icon(
              Icons.bookmark_rounded,
              size: AppSize.s20,
            ),
          ),
        ],
        currentIndex: _getSelectedIndex(context),
        onTap: (index) => _onItemTapped(index, context),
      ),
    );
  }

  int _getSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(moviesPath)) {
      return 0;
    }

    if (location.startsWith(searchPath)) {
      return 1;
    }
    if (location.startsWith(watchlistPath)) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.goNamed(AppRoutes.moviesRoute);
        break;

      case 1:
        context.goNamed(AppRoutes.searchRoute);
        break;
      case 2:
        context.goNamed(AppRoutes.watchlistRoute);
        break;
    }
  }
}