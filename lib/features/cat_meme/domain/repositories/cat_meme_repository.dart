import '../entities/cat_filter.dart';
import '../entities/cat_meme.dart';

/// Contrato que debe cumplir la capa de datos.
abstract class CatMemeRepository {
  CatMeme buildMeme({
    required String text,
    required CatFilter filter,
    required int seed,
  });
}
