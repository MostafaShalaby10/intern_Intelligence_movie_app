import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_intern_intelligence/core/presentation/components/slider_card_image.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../watchlist/presentation/controllers/watchlist_bloc/watchlist_bloc.dart';
import '../../domain/entities/media.dart';
import '../../domain/entities/media_details.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_values.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    required this.mediaDetails,
    required this.detailsWidget,
    super.key,
  });

  final MediaDetails mediaDetails;
  final Widget detailsWidget;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    context
        .read<WatchlistBloc>()
        .add(CheckItemAddedEvent(tmdbId: mediaDetails.tmdbID));
    return SafeArea(
      child: Stack(
        children: [
          SliderCardImage(imageUrl: mediaDetails.backdropUrl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: SizedBox(
              height: size.height * 0.6,
              child: Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.p8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (mediaDetails.trailerUrl.isNotEmpty) ...[
                      InkWell(
                        onTap: () async {
                          final url = Uri.parse(mediaDetails.trailerUrl);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          }
                        },
                        child: Container(
                       width: MediaQuery.of(context).size.width /2,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(25)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text(
                                                     "Play" ,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: AppPadding.p12,
              left: AppPadding.p16,
              right: AppPadding.p16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.iconContainerColor,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.secondaryText,
                      size: AppSize.s20,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    mediaDetails.isAdded
                        ? context
                            .read<WatchlistBloc>()
                            .add(RemoveWatchListItemEvent(mediaDetails.id!))
                        : context.read<WatchlistBloc>().add(
                              AddWatchListItemEvent(
                                  media: Media.fromMediaDetails(mediaDetails)),
                            );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.iconContainerColor,
                    ),
                    child: BlocConsumer<WatchlistBloc, WatchlistState>(
                      listener: (context, state) {
                        if (state.status == WatchlistRequestStatus.itemAdded) {
                          mediaDetails.id = state.id;
                          mediaDetails.isAdded = true;
                        } else if (state.status ==
                            WatchlistRequestStatus.itemRemoved) {
                          mediaDetails.id = null;
                          mediaDetails.isAdded = false;
                        } else if (state.status ==
                                WatchlistRequestStatus.isItemAdded &&
                            state.id != -1) {
                          mediaDetails.id = state.id;
                          mediaDetails.isAdded = true;
                        }
                      },
                      builder: (context, state) {
                        return Icon(
                          Icons.bookmark_rounded,
                          color: mediaDetails.isAdded
                              ? AppColors.primary
                              : AppColors.secondaryText,
                          size: AppSize.s20,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}