import 'package:dartz/dartz.dart';

import '../../../core/data/error/failure.dart';
import '../repository/watchlist_repository.dart';


class RemoveWatchlistItemUseCase {
  final WatchlistRepository _baseWatchListRepository;

  RemoveWatchlistItemUseCase(this._baseWatchListRepository);

  @override
  Future<Either<Failure, Unit>> call(int p) async {
    return await _baseWatchListRepository.removeWatchListItem(p);
  }
}