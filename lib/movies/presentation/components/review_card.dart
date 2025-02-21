import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app_intern_intelligence/movies/presentation/components/review_content.dart';

import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_values.dart';
import '../../../core/utils/functions.dart';
import '../../domain/entities/review.dart';
import 'avatar.dart';

class ReviewCard extends StatelessWidget {
  final Review review;
  const ReviewCard({
    required this.review,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        showCustomBottomSheet(context, ReviewContent(review: review));
      },
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p12),
        width: AppSize.s240,
        height: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.secondaryBackground,
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),

      ),
    );
  }
}

