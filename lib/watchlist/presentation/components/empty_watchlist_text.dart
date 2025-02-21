import 'package:flutter/material.dart';

import '../../../core/resources/app_strings.dart';
import '../../../core/resources/app_values.dart';


class EmptyWatchlistText extends StatelessWidget {
  const EmptyWatchlistText({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            AppStrings.watchlistIsEmpty,
            style: textTheme.titleMedium,
          ),
        ),

      ],
    );
  }
}