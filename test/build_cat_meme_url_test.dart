import 'package:flutter_test/flutter_test.dart';
import 'package:reto2_memes_gatos/features/cat_meme/data/datasources/cat_meme_remote_datasource.dart';
import 'package:reto2_memes_gatos/features/cat_meme/data/repositories/cat_meme_repository_impl.dart';
import 'package:reto2_memes_gatos/features/cat_meme/domain/entities/cat_filter.dart';
import 'package:reto2_memes_gatos/features/cat_meme/domain/usecases/build_cat_meme_url.dart';

void main() {
  const useCase = BuildCatMemeUrl(
    CatMemeRepositoryImpl(CatMemeRemoteDataSource()),
  );

  test('sin texto devuelve un gato aleatorio simple', () {
    final meme = useCase(text: '   ', seed: 1);
    final uri = Uri.parse(meme.imageUrl);

    expect(uri.host, 'cataas.com');
    expect(uri.path, '/cat');
    expect(uri.queryParameters.containsKey('filter'), isFalse);
  });

  test('con texto usa /cat/says/<texto> codificado', () {
    final meme = useCase(text: 'Hola mundo', seed: 1);
    final uri = Uri.parse(meme.imageUrl);

    expect(uri.pathSegments, ['cat', 'says', 'Hola mundo']);
    expect(meme.imageUrl, contains('Hola%20mundo'));
  });

  test('agrega el filtro elegido a la URL', () {
    final meme = useCase(text: 'Miau', filter: CatFilter.sepia, seed: 1);

    expect(Uri.parse(meme.imageUrl).queryParameters['filter'], 'sepia');
  });

  test('cambiar el seed cambia la URL (otro gato)', () {
    final a = useCase(text: 'Miau', seed: 1);
    final b = useCase(text: 'Miau', seed: 2);

    expect(a.imageUrl, isNot(b.imageUrl));
  });

  test('un "/" en el texto no rompe la ruta', () {
    final meme = useCase(text: 'a/b', seed: 1);

    expect(Uri.parse(meme.imageUrl).pathSegments, ['cat', 'says', 'a/b']);
  });
}
