import '../../domain/entities/cat_filter.dart';
import '../../domain/entities/cat_meme.dart';
import '../../domain/repositories/cat_meme_repository.dart';
import '../datasources/cat_meme_remote_datasource.dart';

class CatMemeRepositoryImpl implements CatMemeRepository {
  const CatMemeRepositoryImpl(this._dataSource);

  final CatMemeRemoteDataSource _dataSource;

  @override
  CatMeme buildMeme({
    required String text,
    required CatFilter filter,
    required int seed,
  }) {
    final uri = _dataSource.buildUri(
      text: text,
      filter: filter.apiValue,
      seed: seed,
    );
    return CatMeme(imageUrl: uri.toString(), text: text);
  }
}
