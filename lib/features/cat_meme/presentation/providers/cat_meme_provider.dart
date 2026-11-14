import 'package:flutter/foundation.dart';

import '../../domain/entities/cat_filter.dart';
import '../../domain/entities/cat_meme.dart';
import '../../domain/usecases/build_cat_meme_url.dart';

/// Maneja el estado de la pantalla: texto, filtro y gato actual.
class CatMemeProvider extends ChangeNotifier {
  CatMemeProvider(this._buildCatMemeUrl) {
    _refresh();
  }

  final BuildCatMemeUrl _buildCatMemeUrl;

  String _text = '';
  CatFilter _filter = CatFilter.none;
  int _seed = DateTime.now().millisecondsSinceEpoch;
  late CatMeme _meme;

  CatMeme get meme => _meme;
  CatFilter get filter => _filter;

  /// Aplica el texto escrito por el usuario a la imagen.
  void applyText(String text) {
    _text = text;
    _refresh();
  }

  /// Cambia el filtro conservando el mismo gato.
  void selectFilter(CatFilter filter) {
    if (filter == _filter) return;
    _filter = filter;
    _refresh();
  }

  /// Pide otro gato aleatorio.
  void newCat() {
    _seed = DateTime.now().millisecondsSinceEpoch;
    _refresh();
  }

  void _refresh() {
    _meme = _buildCatMemeUrl(text: _text, filter: _filter, seed: _seed);
    notifyListeners();
  }
}
