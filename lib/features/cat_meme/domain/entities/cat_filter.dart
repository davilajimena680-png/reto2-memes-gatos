/// Filtros disponibles en la API de Cataas (parametro `filter`).
enum CatFilter {
  none('Normal', null),
  mono('Blanco y negro', 'mono'),
  sepia('Sepia', 'sepia'),
  negative('Negativo', 'negative'),
  blur('Desenfoque', 'blur'),
  paint('Pintura', 'paint'),
  pixel('Pixelado', 'pixel');

  const CatFilter(this.label, this.apiValue);

  /// Texto que ve el usuario.
  final String label;

  /// Valor que se manda en la URL (null = sin filtro).
  final String? apiValue;
}
