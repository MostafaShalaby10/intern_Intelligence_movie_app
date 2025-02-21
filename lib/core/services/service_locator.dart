
import 'package:get_it/get_it.dart';

import '../../movies/data/datasource/movies_remote_data_source.dart';
import '../../movies/data/repository/movies_repository_impl.dart';
import '../../movies/domain/repository/movies_repository.dart';
import '../../movies/domain/usecases/get_all_popular_movies_usecase.dart';
import '../../movies/domain/usecases/get_all_top_rated_movies_usecase.dart';
import '../../movies/domain/usecases/get_movie_details_usecase.dart';
import '../../movies/domain/usecases/get_movies_usecase.dart';
import '../../movies/presentation/controllers/movie_details_bloc/movie_details_bloc.dart';
import '../../movies/presentation/controllers/movies_bloc/movies_bloc.dart';
import '../../movies/presentation/controllers/popular_movies_bloc/popular_movies_bloc.dart';
import '../../movies/presentation/controllers/top_rated_movies_bloc/top_rated_movies_bloc.dart';
import '../../search/data/datasource/search_remote_data_source.dart';
import '../../search/data/repository/search_repository_impl.dart';
import '../../search/domain/repository/search_repository.dart';
import '../../search/domain/usecases/search_usecase.dart';
import '../../search/presentation/controllers/search_bloc/search_bloc.dart';

import '../../tv_list/data/datasource/tv_shows_remote_data_source.dart';
import '../../tv_list/data/repository/tv_shows_repository_impl.dart';
import '../../tv_list/domain/repository/tv_shows_repository.dart';
import '../../tv_list/domain/usecases/get_all_popular_tv_shows_usecase.dart';
import '../../tv_list/domain/usecases/get_all_top_rated_tv_shows_usecase.dart';
import '../../tv_list/domain/usecases/get_season_details_usecase.dart';
import '../../tv_list/domain/usecases/get_tv_show_details_usecase.dart';
import '../../tv_list/domain/usecases/get_tv_shows_usecase.dart';
import '../../tv_list/presentation/controllers/popular_tv_shows_bloc/popular_tv_shows_bloc.dart';
import '../../tv_list/presentation/controllers/top_rated_tv_shows_bloc/top_rated_tv_shows_bloc.dart';
import '../../tv_list/presentation/controllers/tv_show_details_bloc/tv_show_details_bloc.dart';
import '../../tv_list/presentation/controllers/tv_shows_bloc/tv_shows_bloc.dart';
import '../../watchlist/data/datasource/watchlist_local_data_source.dart';
import '../../watchlist/data/repository/watchlist_repository_impl.dart';
import '../../watchlist/domain/repository/watchlist_repository.dart';
import '../../watchlist/domain/usecases/add_watchlist_item_usecase.dart';
import '../../watchlist/domain/usecases/check_if_item_added_usecase.dart';
import '../../watchlist/domain/usecases/get_watchlist_items_usecase.dart';
import '../../watchlist/domain/usecases/remove_watchlist_item_usecase.dart';
import '../../watchlist/presentation/controllers/watchlist_bloc/watchlist_bloc.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static void init() {
    // Data source
    getIt.registerLazySingleton<MoviesRemoteDataSource>(
        () => MoviesRemoteDataSourceImpl());
    getIt.registerLazySingleton<TVShowsRemoteDataSource>(
        () => TVShowsRemoteDataSourceImpl());
    getIt.registerLazySingleton<SearchRemoteDataSource>(
        () => SearchRemoteDataSourceImpl());
    getIt.registerLazySingleton<WatchlistLocalDataSource>(
        () => WatchlistLocalDataSourceImpl());

    // Repository
    getIt.registerLazySingleton<MoviesRespository>(
        () => MoviesRepositoryImpl(getIt()));
    getIt.registerLazySingleton<TVShowsRepository>(
        () => TVShowsRepositoryImpl(getIt()));
    getIt.registerLazySingleton<SearchRepository>(
        () => SearchRepositoryImpl(getIt()));
    getIt.registerLazySingleton<WatchlistRepository>(
        () => WatchListRepositoryImpl(getIt()));

    // Use Cases
    getIt.registerLazySingleton(() => GetMoviesDetailsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetAllPopularMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetAllTopRatedMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTVShowsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTVShowDetailsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetSeasonDetailsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetAllPopularTVShowsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetAllTopRatedTVShowsUseCase(getIt()));
    getIt.registerLazySingleton(() => SearchUseCase(getIt()));
    getIt.registerLazySingleton(() => GetWatchlistItemsUseCase(getIt()));
    getIt.registerLazySingleton(() => AddWatchlistItemUseCase(getIt()));
    getIt.registerLazySingleton(() => RemoveWatchlistItemUseCase(getIt()));
    getIt.registerLazySingleton(() => CheckIfItemAddedUseCase(getIt()));

    // Bloc
    getIt.registerFactory(() => MoviesBloc(getIt()));
    getIt.registerFactory(() => MovieDetailsBloc(getIt()));
    getIt.registerFactory(() => PopularMoviesBloc(getIt()));
    getIt.registerFactory(() => TopRatedMoviesBloc(getIt()));
    getIt.registerFactory(() => TVShowsBloc(getIt()));
    getIt.registerFactory(() => TVShowDetailsBloc(getIt(), getIt()));
    getIt.registerFactory(() => PopularTVShowsBloc(getIt()));
    getIt.registerFactory(() => TopRatedTVShowsBloc(getIt()));
    getIt.registerFactory(() => SearchBloc(getIt()));
    getIt.registerFactory(() => WatchlistBloc(getIt(), getIt(), getIt(), getIt()));
  }
}