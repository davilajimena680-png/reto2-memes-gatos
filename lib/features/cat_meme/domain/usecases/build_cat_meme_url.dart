import '../entities/cat_filter.dart';
import '../entities/cat_meme.dart';
import '../repositories/cat_meme_repository.dart';

/// Caso de uso: arma el meme (URL dinamica) a partir del texto y el filtro.
class BuildCatMemeUrl {
  const BuildCatMemeUrl(this._repository);

  final CatMemeRepository _repository;

  /// [seed] cambia la URL para que Cataas devuelva otro gato.
  CatMeme call({
    required String text,
    CatFilter filter = CatFilter.none,
    required int seed,
  }) {
    return _repository.buildMeme(
      text: text.trim(),
      filter: filter,
      seed: seed,
    );
  }
}
